# Bake definition for the MariaDB image.
#
# The tag/label scheme is NOT hardcoded here: CI runs docker/metadata-action,
# which generates two bake files populating the `docker-metadata-action`
# target below (tags + OCI labels). Every real target inherits that stub, so
# the tags always come from the workflow's `metadata-tags` configuration.
#
# Local use:
#   docker buildx bake            # builds `app`, untagged
#   docker buildx bake --print    # inspect the resolved definition

# Stub populated at build time by docker/metadata-action's generated bake
# files. Never add tags to a target that inherits it — they would be
# overridden by (or fight with) the generated definition.
target "docker-metadata-action" {}

target "app" {
  inherits   = ["docker-metadata-action"]
  context    = "."
  dockerfile = "Dockerfile"
}

group "default" {
  targets = ["app"]
}
