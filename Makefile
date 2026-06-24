.DEFAULT_GOAL := help

CONDA_PREFIX = ./.venv

.PHONY: setup
setup:  ## Setup the development environment
	git lfs install

	conda env create -p $(CONDA_PREFIX)
	conda run -p $(CONDA_PREFIX) pre-commit install

	@echo "Activate the Conda environment:"
	@echo "  $$ conda activate $(CONDA_PREFIX)"

.PHONY: render
render:  ## Render website
	Rscript -e 'blogdown::build_site(local = TRUE, build_rmd = "timestamp")'

.PHONY: preview
preview:  ## Render and preview website
	quarto preview melloc

.PHONY: lint
lint:  ## Run pre-commit hooks on all files
	conda run -p $(CONDA_PREFIX) pre-commit run --all-files

.PHONY: help
help:  ## Show this help message
	@printf "\033[32mUsage:\033[0m \033[36mmake <COMMAND>\033[0m\n"
	@echo ""
	@printf "\033[32mCommands:\033[0m\n"
	@grep -E '^[a-z-]+:.*##' $(MAKEFILE_LIST) | awk -F ':.*## ' '{ printf "  \033[36m%-9s\033[0m %s\n", $$1, $$2 }'
