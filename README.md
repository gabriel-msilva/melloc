# melloc()

A personal blog built with R's [blogdown](https://bookdown.org/yihui/blogdown/)
using a slightly modified [Hugo PaperMod](https://themes.gohugo.io/themes/hugo-papermod/).

Visit the blog page at [**gabriel-msilva.github.io/melloc**](https://gabriel-msilva.github.io/melloc)

## Development

[Makefile](./Makefile) provides basic commands for development.

```console
$ make
build                          Build site with blogdown.
help                           Show this help and exit.
serve                          Serve blogdown site.
setup                          Create Conda environment and install pre-commit hooks.
```

Environment is managed with [Conda](https://docs.anaconda.com/free/miniconda/index.html).

```sh
make build
conda activate ./.venv
```

### Live preview in WSL

[`blogdown::serve_site()`](https://pkgs.rstudio.com/blogdown/reference/serve_site.html)
does not update on file save in local server from WSL to Windows browser.
If you are using [WSL](https://learn.microsoft.com/en-us/windows/wsl/install) with WSLg support,
you can install a web browser to have a more interactive development experience.

```sh
sudo apt-get install firefox
```

### Support Math expressions through MathJax

PaperMod does not support Math by default but it is easily implemented.
Curiously, [PaperMod Math Typesetting](https://adityatelange.github.io/hugo-PaperMod/posts/math-typesetting/)
did not work, but [bookdown implementation](https://bookdown.org/yihui/blogdown/templates.html#how-to)
did just fine.

Just add file [`layouts/partials/extend_head.html`](./layouts/partials/extend_head.html) with contents:

```html
{{ if or .Params.math .Site.Params.math }}
<script src="//yihui.org/js/math-code.js"></script>
<script
  async
  src="//cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/MathJax.js?config=TeX-MML-AM_CHTML"
></script>
{{ end }}
```
