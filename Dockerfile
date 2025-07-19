FROM cruizba/ubuntu-dind:noble-latest

ARG TARGETPLATFORM

COPY vscode*.tar.gz /

RUN apt-get update && \
  apt-get install -y git curl && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* && \
  if [ "$TARGETPLATFORM" = "linux/amd64" ]; then \
      tar -xzf /vscode-x64.tar.gz -C /usr/bin; \
  elif [ "$TARGETPLATFORM" = "linux/arm64" ]; then \
      tar -xzf /vscode-arm64.tar.gz -C /usr/bin; \
  else \
  echo "Unsupported architecture: $TARGETPLATFORM"; exit 1; \
  fi && \
  rm -rf /vscode*.tar.gz && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

CMD [ "code", "tunnel", "--accept-server-license-terms" ]