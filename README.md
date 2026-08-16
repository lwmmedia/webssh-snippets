# webssh-snippets

Ready-to-use, mobile-first SSH snippets for the WebSSH client on iOS and macOS.

<!-- TODO: replace <GIST_URL> with the public gist URL once the gist exists. -->
WebSSH sync URL: <GIST_URL>

## Why mobile-first

A snippet here is written for a phone screen (about 380px wide) over a mobile
SSH session, not for a desktop terminal. Every snippet follows these rules:

- **Non-interactive only.** No `top`, `htop`, `less`, `more`, `vim`, `watch` or
  `tail -f`. Pagers are always disabled with `--no-pager`, `-n` or `| head`.
- **Terminates in a few seconds.** iOS suspends the app after roughly 30
  seconds in the background, so nothing long-running or streaming.
- **Eight lines of output or fewer**, narrow enough to read without horizontal
  scrolling. Aligned columns are preferred over wide tables.
- **One snippet answers one diagnostic question.** If you need two answers, use
  two snippets.
- **No environment-specific values.** Hosts, users and DNs are placeholders.

Every file starts with a one-line comment stating the purpose and the shape of
the expected output, so you can pick the right snippet from the list alone.

## Naming convention

Snippets live in a flat `snippets/` directory. Gists have no subdirectories, so
the sort prefix carries the grouping.

Files are named `NN-category-action.ext`.

| Range | Category   | Scope                                     | Extension |
| ----- | ---------- | ----------------------------------------- | --------- |
| 10-19 | `net`      | Generic network reachability and DNS      | `.sh`     |
| 20-29 | `linux`    | System health, disk, memory, services     | `.sh`     |
| 30-39 | `pfsense`  | Firewall state and services               | `.sh`     |
| 40-49 | `mikrotik` | RouterOS console commands                 | `.rsc`    |
| 50-59 | `win`      | PowerShell one-liners                     | `.ps1`    |

Example: `21-linux-disk-usage.sh`.

## Install

WebSSH can pull its snippet library from a public gist, so the phone stays in
sync with this repository.

1. Create a public gist and copy its id (the hex string in the gist URL).
2. In the repository settings, add:
   - a repository variable `WEBSSH_GIST_ID` set to that gist id;
   - a repository secret `GIST_TOKEN` holding a token with the `gist` scope.
3. Push to `main`. The `sync-gist` workflow validates `snippets/` and mirrors
   its contents to the gist.
4. In WebSSH, open the snippet list and choose **Import from Gist**, then paste
   the gist page URL recorded above, in the form
   `https://gist.github.com/USER/GIST_ID`. The same field also accepts a bare
   GitHub username, which lists that account's public gists.

WebSSH imports the snippets into its own local list, so run the import again to
pick up later changes published by the workflow.

Snippets can also be used without WebSSH: each file is plain text meant to be
pasted into an interactive shell.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for the naming rules, the acceptance
checklist a snippet must pass, and the rule that no environment-specific value
is ever committed.

## License

MIT, see [LICENSE](LICENSE).
