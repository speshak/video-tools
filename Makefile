all: video_tools autorender

.PHONY: video_tools
video_tools: Dockerfile
	docker build . -t speshak/video-tools

.PHONY: autorender
autorender: Dockerfile.autorender
	docker build . -f Dockerfile.autorender -t speshak/autorender
