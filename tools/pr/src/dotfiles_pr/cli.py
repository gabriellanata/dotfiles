"""Typer CLI for PR helpers."""

from __future__ import annotations

from typing import Annotated

import typer

from dotfiles_pr.commands.list_cmd import run_list
from dotfiles_pr.commands.modify import run_modify
from dotfiles_pr.commands.quick_submit import run_quick_submit
from dotfiles_pr.commands.quick_update import run_quick_update

app = typer.Typer(
    name="pr",
    help="GitHub PR helpers (bulk PR actions, git-pile submit/update).",
    invoke_without_command=True,
    no_args_is_help=True,
    pretty_exceptions_enable=False,
)


@app.command(help="Approve open PRs matching SEARCH (gh search).")
def approve(
    search: Annotated[str, typer.Argument(help="GitHub PR search string.")],
) -> None:
    raise typer.Exit(run_modify("approve", search, []))


@app.command(help="Merge (squash + auto) open PRs matching SEARCH.")
def merge(
    search: Annotated[str, typer.Argument(help="GitHub PR search string.")],
) -> None:
    raise typer.Exit(run_modify("merge", search, []))


@app.command(help="Same as merge.")
def automerge(
    search: Annotated[str, typer.Argument(help="GitHub PR search string.")],
) -> None:
    raise typer.Exit(run_modify("merge", search, []))


@app.command(help="Rename PR titles for PRs matching SEARCH.")
def rename(
    search: Annotated[str, typer.Argument(help="GitHub PR search string.")],
    title: Annotated[str, typer.Argument(help="New PR title.")],
) -> None:
    raise typer.Exit(run_modify("rename", search, [title]))


@app.command(help="Comment on PRs matching SEARCH.")
def comment(
    search: Annotated[str, typer.Argument(help="GitHub PR search string.")],
    body: Annotated[str, typer.Argument(help="Comment body.")],
) -> None:
    raise typer.Exit(run_modify("comment", search, [body]))


@app.command(
    "list",
    help="List PRs (passes extra args through to gh pr list).",
    context_settings={"allow_extra_args": True, "ignore_unknown_options": True},
)
def list_prs(
    ctx: typer.Context,
    search: Annotated[str, typer.Argument(help="GitHub PR search string.")],
) -> None:
    raise typer.Exit(run_list(search, list(ctx.args)))


@app.command(
    "submit",
    help="Commit staged changes and run git-submitpr.",
    context_settings={"allow_extra_args": True, "ignore_unknown_options": True},
)
def cmd_submit(ctx: typer.Context) -> None:
    raise typer.Exit(run_quick_submit(list(ctx.args)))


@app.command(
    "update",
    help="Fixup commit and run git-updatepr flow.",
    context_settings={"allow_extra_args": True, "ignore_unknown_options": True},
)
def cmd_update(ctx: typer.Context) -> None:
    raise typer.Exit(run_quick_update(list(ctx.args)))
