CONDA_PREFIX = ./.venv

.PHONY: help
help: ## Show this help and exit.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: setup
setup: ## Create Conda environment and install pre-commit hooks.
	conda env create -p $(CONDA_PREFIX)
	conda env update -f environment-dev.yml -p $(CONDA_PREFIX)
	conda run -p $(CONDA_PREFIX) Rscript -e 'blogdown::install_hugo(getOption("blogdown.hugo.version"))'
	conda run -p $(CONDA_PREFIX) pre-commit install

	@echo "Activate the Conda environment:"
	@echo "  $$ conda activate $(CONDA_PREFIX)"

.PHONY: build
build: ## Build site with blogdown.
	Rscript -e 'blogdown::build_site(local = TRUE, build_rmd = "timestamp")'

.PHONY: serve
serve: build ## Serve blogdown site.
	Rscript -e 'blogdown::serve_site()'

.PHONY: stop
stop:
	Rscript -e 'blogdown::stop_server()'
