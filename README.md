# Claude Container Image

## Basic Usage

To run the Claude container easily, use the following commands:

### Podman
```bash
podman run -it --rm --volume `pwd`:/workspace --user node --userns=keep-id ghcr.io/ouvill/claude claude
```

### Docker
```bash
docker run -it --rm --volume `pwd`:/workspace --user node ghcr.io/ouvill/claude claude
```

## Persisting Authentication and Command History

If you want to persist authentication credentials and command history, add the following volume mounts:

### Podman
```bash
podman run -it --rm --volume `pwd`:/workspace -v claude-code-config-volume:/home/node/.claude -v claude-code-bashhistory-volume:/commandhistory --user node --userns=keep-id ghcr.io/ouvill/claude claude
```

### Docker
```bash
docker run -it --rm --volume `pwd`:/workspace -v claude-code-config-volume:/home/node/.claude -v claude-code-bashhistory-volume:/commandhistory --user node ghcr.io/ouvill/claude claude
```

## Setting Up Aliases

For frequent use, it's convenient to set up aliases. Add the following lines to your shell configuration file (`~/.bashrc` or `~/.zshrc`):

### Basic Usage Aliases

#### Podman
```bash
alias claude='podman run -it --rm --volume `pwd`:/workspace --user node --userns=keep-id ghcr.io/ouvill/claude claude'
```

#### Docker
```bash
alias claude='docker run -it --rm --volume `pwd`:/workspace --user node ghcr.io/ouvill/claude claude'
```

### Aliases with Persistence

#### Podman
```bash
alias claude-persist='podman run -it --rm --volume `pwd`:/workspace -v claude-code-config-volume:/home/node/.claude -v claude-code-bashhistory-volume:/commandhistory --user node --userns=keep-id ghcr.io/ouvill/claude claude'
```

#### Docker
```bash
alias claude-persist='docker run -it --rm --volume `pwd`:/workspace -v claude-code-config-volume:/home/node/.claude -v claude-code-bashhistory-volume:/commandhistory --user node ghcr.io/ouvill/claude claude'
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
