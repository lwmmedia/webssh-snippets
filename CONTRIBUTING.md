# Contributing

Thanks for adding a snippet. This repository is public and is mirrored to a
public gist, so every contribution is world-readable the moment it lands.

## Naming convention

Snippets live in a flat `snippets/` directory. No subdirectories: gists do not
support them, and the sync workflow copies top-level files only.

Name files `NN-category-action.ext`, where `NN` is a two-digit sort prefix.

| Range | Category   | Scope                                     | Extension |
| ----- | ---------- | ----------------------------------------- | --------- |
| 10-19 | `net`      | Generic network reachability and DNS      | `.sh`     |
| 20-29 | `linux`    | System health, disk, memory, services     | `.sh`     |
| 30-39 | `pfsense`  | Firewall state and services               | `.sh`     |
| 40-49 | `mikrotik` | RouterOS console commands                 | `.rsc`    |
| 50-59 | `win`      | PowerShell one-liners                     | `.ps1`    |

Pick the next free prefix in the range. Do not renumber existing files: the
prefix is how people find a snippet they already know.

## Acceptance checklist

A snippet is accepted when every box below is true. The target is a phone
screen of about 380px over a mobile SSH session.

- [ ] The first line is a comment stating the purpose and the expected output
      shape.
- [ ] Non-interactive: no `top`, `htop`, `less`, `more`, `vim`, `watch`,
      `tail -f`, or anything that waits for a keypress.
- [ ] Pagers are explicitly disabled: `--no-pager`, `-n`, or `| head`.
- [ ] It terminates in a few seconds. iOS suspends the app after roughly 30
      seconds in the background, so no long-running or streaming commands.
      Network calls carry an explicit timeout.
- [ ] Output is 8 lines or fewer.
- [ ] Output is narrow enough to read without horizontal scrolling. Prefer
      aligned columns over wide tables; truncate with `cut -c` or a format
      string where needed.
- [ ] It answers exactly one diagnostic question. Split it otherwise.
- [ ] It is read-only. Snippets diagnose; they do not change configuration,
      restart services or delete anything.
- [ ] ASCII only: no accented characters, no smart quotes, no emoji.
- [ ] Code, comments, filenames and documentation are in English.

## No environment-specific values

Never commit a value that identifies a real environment. This includes real IP
addresses, hostnames, FQDNs, Active Directory domain names, usernames, ports,
tokens and keys.

Use placeholders instead:

| Instead of        | Use                                     |
| ----------------- | --------------------------------------- |
| A real host       | `HOST`                                  |
| A real user       | `USER`                                  |
| A real IPv4       | `192.0.2.10` (RFC 5737 documentation)   |
| A real domain     | `example.com` (RFC 2606)                |
| A real AD DN      | `OU=PLACEHOLDER,DC=example`             |

The `guard` job in `.github/workflows/sync-gist.yml` enforces this on every
push to `main`. It fails the build when `snippets/` contains a public IP
address outside the documentation and private ranges, a `.local` or `.lan`
hostname suffix, or a `DC=` value other than `DC=example`. Run the same checks
locally before opening a pull request.

Note that `example.local` is rejected by the guard along with every other
`.local` name, so use `example.com` inside `snippets/`.

## Submitting

1. Add the file under `snippets/` with the right prefix.
2. Verify the checklist above against real output, on a phone if you can.
3. Open a pull request describing which question the snippet answers.

By contributing you agree that your work is released under the MIT license in
`LICENSE`.
