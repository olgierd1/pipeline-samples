Build and push image to registry with shell script

```yaml
name: Push image to registry

on: [push]
jobs:
  build_push_image:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout
        uses: actions/checkout@v2

      - name: Build and push
        env:
          REGISTRY_NAME: olgierdos/samples
          APP_NAME: push-image-sample
          VERSION: ${{ github.sha }}
          DOCKER_USERNAME: ${{ secrets.DOCKERHUB_USERNAME }}
          DOCKER_PASSWORD: ${{ secrets.DOCKERHUB_TOKEN }}
        run: |
          sudo chmod +x ./scripts/build_push_image.sh &&\
          ./scripts/build_push_image.sh
```