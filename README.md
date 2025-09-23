# Claude Container Image

## Usage

To run the Claude container, use the following command:

```bash
podman run -it --rm --volume `pwd`:/workspace -v claude-code-config-volume:/home/node/.claude -v claude-code-bashhistory-volume:/commandhistory --user node --userns=keep-id ghcr.io/ouvill/claude claude
```

## alias

You can create an alias for easier access to the Claude container. Add the following line to your shell configuration file (e.g., `~/.bashrc` or `~/.zshrc`):

```bash
alias claude='podman run -it --rm --volume `pwd`:/workspace -v claude-code-config-volume:/home/node/.claude -v claude-code-bashhistory-volume:/commandhistory --user node --userns=keep-id ghcr.io/ouvill/claude claude'
```

## Build

To build the Docker image, run the following command in the directory containing the Dockerfile:

```bash
podman build -t ghcr.io/ouvill/claude:latest .
```
