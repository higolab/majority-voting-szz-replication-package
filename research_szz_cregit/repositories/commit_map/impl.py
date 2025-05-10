from pathlib import Path
import sqlite3

from .repository import ICommitMapRepository, CommitMap


class CommitMapRepository(ICommitMapRepository):
    def __init__(self, db_path: Path) -> None:
        self.__db_path = db_path
        self.__connection = sqlite3.connect(db_path)

    def get_all(self) -> list[CommitMap]:
        cur = self.__connection.cursor()
        cur.execute(
            """
            SELECT
                *
            FROM
                commitmap
            """
        )
        return [CommitMap(*row) for row in cur.fetchall()]
