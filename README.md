# melloc()

A personal blog built with [Quarto](https://quarto.org/).

Visit the blog page at [**gabriel-msilva.github.io/melloc**](https://gabriel-msilva.github.io/melloc)

## Development

The development environment requires tools

- [Quarto](https://quarto.org/docs/get-started/): Render and publishing engine
- [Conda](https://docs.anaconda.com/free/miniconda/index.html): Environment and package manager
- [Git LFS](https://git-lfs.com/): Git extension for large file storage

[Makefile](./Makefile) provides basic commands for development.

```console
$ make help
Usage: make <COMMAND>

Commands:
  setup     Setup the development environment
  render    Render website
  preview   Render and preview website
  help      Show this help message
```

Set up the development environment:

```sh
make setup
conda activate ./.venv
```

Note that the repository uses [pre-commit](https://pre-commit.com/).
