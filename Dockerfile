FROM node:latest

ARG TARGETPLATFORM

RUN INSTALL_OPTIONS=(--init none --no-confirm --extra-conf "sandbox = false") && \
  if [ "${TARGETPLATFORM}" = "linux/arm64" ] || [ "${TARGETPLATFORM}" = "linux/arm/v7" ]; \
  then INSTALL_OPTIONS+=(--extra-conf "filter-syscalls = false"); fi && \
  curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install linux \
  "${INSTALL_OPTIONS[@]}"

ENV PATH="${PATH}:/nix/var/nix/profiles/default/bin"
