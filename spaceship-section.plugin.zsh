#
# CUDA
#
# Showing CUDA version.
# Link: https://www.foobar.xyz

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_CUDA_SHOW=true
SPACESHIP_CUDA_PREFIX=" "
SPACESHIP_CUDA_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"
SPACESHIP_CUDA_SYMBOL="|̲̅̅✇|̲̅̅=̲̅̅|̲̅̅✇|"
SPACESHIP_CUDA_COLOR="green"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show CUDA status
# spaceship_ prefix before section's name is required!
# Otherwise this section won't be loaded.
spaceship_cuda() {
  [[ $SPACESHIP_CUDA_SHOW == false ]] && return

  local cuda_version="cu$(nvcc --version | grep release | awk '{print $6}' | cut -c2-)"

  [[ -z "$cuda_version" ]] && return

  spaceship::section \
    --color "$SPACESHIP_CUDA_COLOR" \
    --prefix "$SPACESHIP_CUDA_PREFIX" \
    --suffix "$SPACESHIP_CUDA_SUFFIX" \
    --symbol "$SPACESHIP_CUDA_SYMBOL" \
    "$cuda_version"
}
