CONDA_PREFIX = ./.venv

.PHONY: setup
setup:
	mamba env create -p $(CONDA_PREFIX)
	mamba env update -f environment-dev.yml -p $(CONDA_PREFIX)
	mamba run -p $(CONDA_PREFIX) Rscript -e 'blogdown::install_hugo(getOption("blogdown.hugo.version"))'
	mamba run -p $(CONDA_PREFIX) pre-commit install

	@echo "Activate the Conda environment:"
	@echo "  $$ mamba activate $(CONDA_PREFIX)"

.PHONY: build
build:
	Rscript -e 'blogdown::build_site(local = TRUE, build_rmd = "timestamp")'

.PHONY: serve
serve: build
	Rscript -e 'blogdown::serve_site()'

.PHONY: stop
stop:
	Rscript -e 'blogdown::stop_server()'
