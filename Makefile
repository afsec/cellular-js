all: build

version:
	@echo "Cellular JS v0.8"

build:
	@./scripts/build.sh


release:
	@./scripts/build.sh -p

debug:
	@./scripts/build.sh -d

clean:
	@./scripts/clean.sh

state:
	@./scripts/new-state.sh $(NAME)
