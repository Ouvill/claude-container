# Claude Container Image

## Usage

To run the Claude container, use one of the following commands:

### Podman
```bash
podman run -it --rm --volume `pwd`:/workspace -v claude-code-config-volume:/home/node/.claude -v claude-code-bashhistory-volume:/commandhistory --user node --userns=keep-id ghcr.io/ouvill/claude claude
```

### Docker
```bash
docker run -it --rm --volume `pwd`:/workspace -v claude-code-config-volume:/home/node/.claude -v claude-code-bashhistory-volume:/commandhistory --user node ghcr.io/ouvill/claude claude
```

## Alias

You can create an alias for easier access to the Claude container. Add one of the following lines to your shell configuration file (e.g., `~/.bashrc` or `~/.zshrc`):

### Podman
```bash
alias claude='podman run -it --rm --volume `pwd`:/workspace -v claude-code-config-volume:/home/node/.claude -v claude-code-bashhistory-volume:/commandhistory --user node --userns=keep-id ghcr.io/ouvill/claude claude'
```

### Docker
```bash
alias claude='docker run -it --rm --volume `pwd`:/workspace -v claude-code-config-volume:/home/node/.claude -v claude-code-bashhistory-volume:/commandhistory --user node ghcr.io/ouvill/claude claude'
```

## Build

To build the container image, use one of the following commands:

### Podman
```bash
podman build -t ghcr.io/ouvill/claude:latest .
```

### Docker
```bash
docker build -t ghcr.io/ouvill/claude:latest .
```
