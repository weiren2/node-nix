FROM node:latest

ARG TARGETPLATFORM

RUN if [ "${TARGETPLATFORM}" = "linux/arm64" ] || [ "${TARGETPLATFORM}" = "linux/arm/v7" ]; then ARM_EXTRA_CONF="\nfilter-syscalls = false"; else ARM_EXTRA_CONF=""; fi \
  && curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install linux \
  --extra-conf "sandbox = false ${ARM_EXTRA_CONF}" \
  --init none \
  --no-confirm
ENV PATH="${PATH}:/nix/var/nix/profiles/default/bin"
