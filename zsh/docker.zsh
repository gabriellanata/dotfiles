# Use Rancher Desktop's Docker engine when its context is available.
# Stops Rancher from warning: "Docker context is currently default instead of rancher-desktop".
if (( $+commands[docker] )); then
  if [[ "$(docker context show 2>/dev/null)" != rancher-desktop ]] \
    && docker context ls -q 2>/dev/null | grep -qx rancher-desktop; then
    docker context use rancher-desktop >/dev/null 2>&1
  fi
fi
