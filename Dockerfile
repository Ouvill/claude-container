FROM node:24-trixie

# Install basic development tools
RUN apt-get update && apt-get install -y --no-install-recommends \
  less \
  procps \
  sudo \
  fzf \
  zsh \
  man-db \
  unzip \
  gnupg2 \
  gh \
  jq \
  nano \
  vim \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install git from source for worktree.userelativepaths support (requires >= 2.48)
ARG GIT_VERSION=2.53.0
RUN apt-get update && apt-get install -y --no-install-recommends \
  zlib1g-dev libcurl4-openssl-dev libexpat1-dev gettext \
  make gcc autoconf \
  && wget -q "https://github.com/git/git/archive/refs/tags/v${GIT_VERSION}.tar.gz" -O /tmp/git.tar.gz \
  && tar -xzf /tmp/git.tar.gz -C /tmp \
  && cd /tmp/git-${GIT_VERSION} \
  && make prefix=/usr/local -j$(nproc) NO_TCLTK=YesPlease NO_PERL=YesPlease all \
  && make prefix=/usr/local install \
  && cd / && rm -rf /tmp/git* \
  && apt-get purge -y make gcc autoconf zlib1g-dev libcurl4-openssl-dev libexpat1-dev \
  && apt-get autoremove -y \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

ARG USERNAME=node


# Persist bash history.
RUN SNIPPET="export PROMPT_COMMAND='history -a' && export HISTFILE=/commandhistory/.bash_history" \
  && mkdir /commandhistory \
  && touch /commandhistory/.bash_history \
  && chown -R $USERNAME /commandhistory

# Create workspace and config directories and set permissions
RUN mkdir -p /workspace /home/node/.claude && \
  chown -R node:node /workspace /home/node/.claude

WORKDIR /workspace

ARG GIT_DELTA_VERSION=0.18.2
RUN ARCH=$(dpkg --print-architecture) && \
  wget "https://github.com/dandavison/delta/releases/download/${GIT_DELTA_VERSION}/git-delta_${GIT_DELTA_VERSION}_${ARCH}.deb" && \
  sudo dpkg -i "git-delta_${GIT_DELTA_VERSION}_${ARCH}.deb" && \
  rm "git-delta_${GIT_DELTA_VERSION}_${ARCH}.deb"

# Set up non-root user
USER node

# Install Claude Code (official installer)
RUN curl -fsSL https://claude.ai/install.sh | bash
ENV PATH="/home/node/.local/bin:$PATH"
ENV CLAUDE_CONFIG_DIR="/home/node/.claude"

