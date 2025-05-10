from __future__ import annotations
from dataclasses import dataclass
from typing import Optional


@dataclass
class CommitMap:
    cid: str
    original_cid: str
    repo: Optional[str] = None

    @staticmethod
    def get_cid_hashmap(commit_map: list[CommitMap]) -> dict[str, CommitMap]:
        return {commit_map.cid: commit_map for commit_map in commit_map}

    @staticmethod
    def get_cid_hashmap_from_original_cid(commit_map: list[CommitMap]) -> dict[str, CommitMap]:
        return {commit_map.original_cid: commit_map for commit_map in commit_map}
