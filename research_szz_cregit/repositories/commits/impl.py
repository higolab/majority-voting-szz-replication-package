from pathlib import Path
import sqlite3

from .repository import ICommitsRepository, Commit


class CommitRepository(ICommitsRepository):
    def __init__(self, db_path: Path) -> None:
        self.__db_path = db_path
        self.__connection = sqlite3.connect(db_path)
        # Some of the commits have non UTF-8 characters in their messages.
        self.__connection.text_factory = lambda b: b.decode(errors="ignore")

    def get_all(self) -> list[Commit]:
        cur = self.__connection.cursor()
        cur.execute(
            """
            SELECT
                *
            FROM
                commits
            """
        )
        return [Commit(*row) for row in cur.fetchall()]
