set -e
IMAGE_TAG="${REGISTRY_NAME}:${APP_NAME}-${VERSION}"
docker login --username=${DOCKER_USERNAME} --password=${DOCKER_PASSWORD}

echo "Building image: ${IMAGE_TAG}"
docker build . -t "${IMAGE_TAG}" \
 -f ./Dockerfile \

echo "Pushing image ${IMAGE_TAG}"
docker push "${IMAGE_TAG}"

echo "Image pushed ${IMAGE_TAG}"
