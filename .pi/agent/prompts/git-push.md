---
description: Commit current branch changes, optionally merge to main, and push
---
Perform the repository branch workflow end-to-end in a way that works across repositories.

Rules:
- Make logical incremental commits on the current branch using the `/git-commit` skill.
- Treat the branch that was current at the start as the working branch.
- If the working branch is not `main` and a `main` branch exists, merge the updated working branch into `main`.
- Push only after every branch involved in the workflow is clean.

Procedure:
1. Inspect the repository status and identify the current branch. Save it as the working branch.
2. Review changed files and group them into logical incremental commits.
3. For each logical group, invoke the `/git-commit` skill to stage and commit the changes with an appropriate conventional commit message.
4. Confirm the working branch is clean with `git status --short`.
5. Check whether a `main` branch exists locally or on the remote.
6. If the working branch is not `main` and `main` exists:
   - Switch to `main`.
   - Merge the working branch into `main`.
   - Resolve or report any conflicts; do not push if the merge fails.
   - Confirm `main` is clean with `git status --short`.
   - Switch back to the working branch and confirm it is still clean.
7. If the working branch is `main`, or no `main` branch exists, skip the merge step.
8. Push the relevant branch refs to the remote. If both the working branch and `main` were updated, push both. If only one branch was updated, push that branch.
9. Report the commits created, merge result if applicable, and push result.

Do not push if any involved branch has uncommitted changes, unresolved conflicts, or a failed merge.
