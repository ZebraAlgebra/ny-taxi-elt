import os
import re
import time
from pathlib import Path

import polars as pl
import sqlalchemy as sqla

from .schemas import Schema, TripDataKeys, TripDatasFilenames


class Loader:
    base_path: Path = Path(__file__).parent.parent / "assets" / "data"
    filename_list_dict: TripDatasFilenames

    def __init__(self):
        self.filename_list_dict = {
            k: self._load_parquets_filenames_from_key(k) for k in TripDataKeys
        }

    def _load_df_height_fast(self, k: TripDataKeys, i: int) -> int:
        filename = self.filename_list_dict[k][i]
        filepath = self.base_path / "trips" / k / filename
        height: int = pl.scan_parquet(filepath).select(pl.len()).collect()[0, 0]
        return height

    def _load_parquets_filenames_from_key(self, k: TripDataKeys) -> list[str]:
        return sorted(
            [
                filename
                for filename in os.listdir(str(self.base_path / "trips" / k))
                if "parquet" in filename
            ]
        )

    def load_as_df(
        self, k: TripDataKeys, i: int, n_rows: int | None = None
    ) -> tuple[str, pl.DataFrame]:
        filename = self.filename_list_dict[k][i]
        filepath = self.base_path / "trips" / k / filename
        return filename, pl.read_parquet(filepath, n_rows=n_rows)

    def load_as_df_schema(self, k: TripDataKeys, i: int) -> tuple[str, Schema]:
        filename = self.filename_list_dict[k][i]
        filepath = self.base_path / "trips" / k / self.filename_list_dict[k][i]
        return filename, pl.read_parquet_schema(filepath)

    def get_lengths(self) -> dict[TripDataKeys, int]:
        return {
            k: len(filename_list)
            for k, filename_list in self.filename_list_dict.items()
        }

    def get_total_height_of_key(self, k: TripDataKeys) -> int:  # this takes time!
        L = len(self.filename_list_dict[k])
        return sum([self._load_df_height_fast(k, l) for l in range(L)])

    def get_schemas(self) -> dict[TripDataKeys, list[Schema]]:
        return {
            k: [self.load_as_df_schema(k, i)[1] for i, _ in enumerate(filename_list)]
            for k, filename_list in self.filename_list_dict.items()
        }


class Writer:
    DB_USER: str = "swang3068"
    DB_PASSWORD: str = "Asdfjkl!3579"
    DB_HOST: str = "localhost"
    DB_PORT: str = "5432"  # Default PostgreSQL port
    DB_NAME: str = "taxi"
    engine: sqla.Engine

    @property
    def uri(self) -> str:
        return f"postgresql+psycopg2://{self.DB_USER}:{self.DB_PASSWORD}@{self.DB_HOST}:{self.DB_PORT}/{self.DB_NAME}"

    def __init__(self) -> None:
        self.engine = sqla.create_engine(self.uri)

    def write_df_to_pg_from_year(self, loader: Loader, k: TripDataKeys, year: int):
        for i, fname in enumerate(loader.filename_list_dict[k]):
            if str(year) in fname:
                print(fname)
                fname, df = loader.load_as_df(k, i)
                tname = self._fname_to_tname(k, fname)
                self._write_df_to_pg_from_tname(df, tname)

    def _write_df_to_pg_from_tname(self, df: pl.DataFrame, tname: str):
        s = time.time()
        conn = self.engine.connect()
        status = df.write_database(
            table_name=tname, connection=self.engine, if_table_exists="replace"
        )
        if status > -1:
            print(f"Successfully written {df.height} rows to {tname}")
        else:
            print(f"Oops! Error occured while writing to {tname}.")
        conn.close()
        print(f"Duration: {time.time() - s : .3f} seconds")

    def dispose(self):
        self.engine.dispose()

    @staticmethod
    def _fname_to_tname(k: TripDataKeys, fname: str) -> str:
        pattern = r"(\d{4}-\d{2})"
        match = re.search(pattern, fname)
        if match:
            yyyy_mm = match.group(1).replace("-", "_")
            return f"{k}_trip.{k}_{yyyy_mm}"
        else:
            raise ValueError(f"There is something wrong with the filename {fname}.")
