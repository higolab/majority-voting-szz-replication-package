from abc import ABC, abstractmethod
from research_szz_cregit.models.commit_map import CommitMap


class ICommitMapRepository(ABC):
    @abstractmethod
    def get_all(self) -> list[CommitMap]:
        pass
