from abc import ABC, abstractmethod
from research_szz_cregit.models.commit import Commit


class ICommitsRepository(ABC):
    @abstractmethod
    def get_all(self) -> list[Commit]:
        pass
