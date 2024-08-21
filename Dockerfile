FROM node:latest

ARG TARGETPLATFORM

RUN if [ "${TARGETPLATFORM}" = "linux/arm64" ] || [ "${TARGETPLATFORM}" = "linux/arm/v7" ]; then \
    curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install linux \
    --init none --no-confirm --extra-conf "sandbox = false" --extra-conf "filter-syscalls = false"; \
  else \
    curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install linux \
    --init none --no-confirm --extra-conf "sandbox = false"; \
  fi

ENV PATH="${PATH}:/nix/var/nix/profiles/default/bin"
