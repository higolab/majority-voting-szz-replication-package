from dataclasses import dataclass


@dataclass(frozen=True)
class Commit:
    cid: str
    author_name: str
    author_email: str
    author_date: str
    committer_name: str
    committer_email: str
    commit_date: str
    summary: str
    is_merge: bool
