DOCKER_IMAGE ?= ghcr.io/xu-cheng/texlive-historic-debian:2024

.PHONY: all pdf pdf-docker clean

all: pdf

pdf:
	@sh scripts/build-pdf.sh

pdf-docker:
	@command -v docker >/dev/null 2>&1 || { echo "Docker non è installato." >&2; exit 1; }
	@docker info >/dev/null 2>&1 || { echo "Il daemon Docker non è disponibile: installa/avvia Docker Desktop e riprova." >&2; exit 1; }
	@docker run --rm --user "$$(id -u):$$(id -g)" -e HOME=/tmp \
		-v "$$(pwd):/work" -w /work $(DOCKER_IMAGE) sh scripts/build-pdf.sh

clean:
	@rm -rf build/.latex build/phy.pdf
