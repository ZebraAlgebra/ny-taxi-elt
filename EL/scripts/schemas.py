import datetime
from enum import Enum
from typing import TypedDict

from polars.datatypes import DataType


class OtherDataSpecDict(TypedDict):
    url: str
    filename: str


class TripRecordRangeDict(TypedDict):
    prefix: str
    start_dt: datetime.datetime
    end_dt: datetime.datetime


class TripDataKeys(str, Enum):
    yellow = "yellow"
    green = "green"
    fhv = "fhv"
    fhvhv = "fhvhv"


type TripDatasFilenames = dict[TripDataKeys, list[str]]

type Schema = dict[str, DataType]
