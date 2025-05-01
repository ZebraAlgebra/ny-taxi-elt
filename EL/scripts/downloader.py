import datetime
import os
import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.resolve()))

import requests
from dateutil.relativedelta import relativedelta

from .schemas import OtherDataSpecDict, TripRecordRangeDict


class Downloader:
    download_base_path: Path
    trip_data_base_url: str

    def __init__(self) -> None:
        self.download_base_path = Path(__file__).parent.parent / "assets" / "data"
        self.trip_data_base_url = "https://d37ci6vzurychx.cloudfront.net/trip-data"

    def download_trip_record(self, prefix: str, year: int, month: int) -> None:
        remote_filename = f"{prefix}_tripdata_{year}-{month:02}.parquet"
        local_directory = self.download_base_path / "trips" / prefix
        if not os.path.exists(local_directory):
            os.makedirs(local_directory)
        local_filepath = str(
            self.download_base_path / "trips" / prefix / remote_filename
        )
        url = f"{self.trip_data_base_url}/{remote_filename}"
        with requests.get(url, stream=True) as r:
            status = r.status_code
            if status != 200:
                return
            with open(local_filepath, "wb") as f:
                for chunk in r.iter_content(chunk_size=5 * 10**7):
                    chunk: bytes
                    _ = f.write(chunk)
            print(f"Downloaded {url} to {local_filepath}")

    def download_trip_records(self, trrds: list[TripRecordRangeDict]):
        for trrd in trrds:
            current: datetime.datetime = trrd["start_dt"]
            while current <= trrd["end_dt"]:
                self.download_trip_record(trrd["prefix"], current.year, current.month)
                current += relativedelta(months=1)

    def download_other_data(self, odsd: OtherDataSpecDict):
        local_directory = self.download_base_path / "other"
        local_filepath = local_directory / odsd["filename"]
        url = odsd["url"]
        with requests.get(url, stream=True) as r:
            status = r.status_code
            if status != 200:
                return
            with open(local_filepath, "wb") as f:
                for chunk in r.iter_content(chunk_size=5 * 10**7):
                    chunk: bytes
                    _ = f.write(chunk)
            print(f"Downloaded {url} to {local_filepath}")

    def download_other_data_multiple(self, odsds: list[OtherDataSpecDict]):
        for odsd in odsds:
            self.download_other_data(odsd)


if __name__ == "__main__":
    downloader = Downloader()
    downloader.download_trip_records(
        [
            {
                "prefix": "yellow",
                "start_dt": datetime.datetime(2025, 2, 1),
                "end_dt": datetime.datetime(2025, 4, 15),
            },
            {
                "prefix": "green",
                "start_dt": datetime.datetime(2025, 2, 1),
                "end_dt": datetime.datetime(2025, 4, 15),
            },
            {
                "prefix": "fhv",
                "start_dt": datetime.datetime(2025, 2, 1),
                "end_dt": datetime.datetime(2025, 4, 15),
            },
            {
                "prefix": "fhvhv",
                "start_dt": datetime.datetime(2025, 2, 1),
                "end_dt": datetime.datetime(2025, 4, 15),
            },
        ]
    )
    # downloader.download_other_data_multiple(
    #     [
    #         {
    #             "url": "https://www.nyc.gov/assets/tlc/downloads/pdf/trip_record_user_guide.pdf",
    #             "filename": "trip_record_user_guide.pdf",
    #         },
    #         {
    #             "url": "https://www.nyc.gov/assets/tlc/downloads/pdf/data_dictionary_trip_records_yellow.pdf",
    #             "filename": "data_dict_yellow.pdf",
    #         },
    #         {
    #             "url": "https://www.nyc.gov/assets/tlc/downloads/pdf/data_dictionary_trip_records_green.pdf",
    #             "filename": "data_dict_green.pdf",
    #         },
    #         {
    #             "url": "https://www.nyc.gov/assets/tlc/downloads/pdf/data_dictionary_trip_records_fhv.pdf",
    #             "filename": "data_dict_fhv.pdf",
    #         },
    #         {
    #             "url": "https://www.nyc.gov/assets/tlc/downloads/pdf/data_dictionary_trip_records_hvfhs.pdf",
    #             "filename": "data_dict_fhvhv.pdf",
    #         },
    #         {
    #             "url": "https://d37ci6vzurychx.cloudfront.net/misc/taxi_zone_lookup.csv",
    #             "filename": "taxi_zone_lookup.csv",
    #         },
    #         {
    #             "url": "https://d37ci6vzurychx.cloudfront.net/misc/taxi_zones.zip",
    #             "filename": "taxi_zones_shapes.zip",
    #         },
    #         {
    #             "url": "https://www.nyc.gov/assets/tlc/images/content/pages/about/taxi_zone_map_bronx.jpg",
    #             "filename": "taxi_zones_shapes_bronx.jpg",
    #         },
    #         {
    #             "url": "https://www.nyc.gov/assets/tlc/images/content/pages/about/taxi_zone_map_brooklyn.jpg",
    #             "filename": "taxi_zones_shapes_brooklyn.jpg",
    #         },
    #         {
    #             "url": "https://www.nyc.gov/assets/tlc/images/content/pages/about/taxi_zone_map_manhattan.jpg",
    #             "filename": "taxi_zones_shapes_manhattan.jpg",
    #         },
    #         {
    #             "url": "https://www.nyc.gov/assets/tlc/images/content/pages/about/taxi_zone_map_queens.jpg",
    #             "filename": "taxi_zones_shapes_queens.jpg",
    #         },
    #         {
    #             "url": "https://www.nyc.gov/assets/tlc/images/content/pages/about/taxi_zone_map_statten_island.jpg",
    #             "filename": "taxi_zones_shapes_statten_island.jpg",
    #         },
    #     ]
    # )
