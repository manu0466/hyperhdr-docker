# Define the HyperHDR version here
HYPERHDR_VERSION ?= 21.0.0.0

# Define the image name prefix
IMAGE_NAME = manu0466/hyperhdr

.PHONY: amd64 amd64

arm64:
	docker buildx build --platform linux/arm64 \
		--build-arg HYPERHDR_VERSION=$(HYPERHDR_VERSION) \
		--build-arg ARCH=aarch64 \
		-t $(IMAGE_NAME):$(HYPERHDR_VERSION) --push .	

amd64:
	docker buildx build --platform linux/amd64 \
		--build-arg HYPERHDR_VERSION=$(HYPERHDR_VERSION) \
		--build-arg ARCH=x86_64 \
		-t $(IMAGE_NAME):$(HYPERHDR_VERSION) --push .	
