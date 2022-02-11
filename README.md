melloc() blog
=============

A personal blog built with R's [blogdown](https://bookdown.org/yihui/blogdown/) 
using a slightly modified [Hugo PaperMod](https://themes.gohugo.io/themes/hugo-papermod/).

> [gabriel-msilva.github.io](https://gabriel-msilva.github.io)

---

### Dependencies

Some additional dependencies I needed in order to install all R packages (Pop_OS! 21.10). 
R packages are managed by [renv](https://rstudio.github.io/renv/articles/renv.html).

* `showtext`

  ```bash
  sudo apt-get install libcurl4-openssl-dev
  sudo apt-get install libfreetype6-dev
  ```

* [`png`](https://stackoverflow.com/questions/21800909/cannot-build-r-package-png-fedora-20)

  ```bash
  sudo apt-get install libpng-dev
  ```

* [`RcppEigen`](https://stackoverflow.com/questions/39811872/r-fails-to-install-packages-at-load-stage-under-linuxmint-ubuntu)

  ```bash
  sudo apt-get install r-base-dev
  ```

### Support Math expressions through MathJax

PaperMod does not support Math by default but it is easily implemented.
Curiously, [PaperMod Math Typesetting](https://adityatelange.github.io/hugo-PaperMod/posts/math-typesetting/)
did not work, but [bookdown implementation](https://bookdown.org/yihui/blogdown/templates.html#how-to) did just fine.

Just add file `layouts/partials/extend_head.html` with contents:

```html
{{ if or .Params.math .Site.Params.math }}
  <script src="//yihui.org/js/math-code.js"></script>
  <script async
    src="//cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/MathJax.js?config=TeX-MML-AM_CHTML">
  </script>
{{ end }}
```
