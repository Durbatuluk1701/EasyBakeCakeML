<!---
This file was generated from `meta.yml`, please do not edit manually.
Follow the instructions on https://github.com/coq-community/templates to regenerate.
--->
# Easy Bake CakeML - CakeML Extraction Plugin

[![Docker CI][docker-action-shield]][docker-action-link]

[docker-action-shield]: https://github.com/Durbatuluk1701/EasyBakeCakeML/actions/workflows/docker-action.yml/badge.svg?branch=main
[docker-action-link]: https://github.com/Durbatuluk1701/EasyBakeCakeML/actions/workflows/docker-action.yml




An extraction plugin for CakeML that does not require any semantic preservation proofs.

## Meta

- Author(s):
  - TJ Barclay
  - Will Thomas
- License: [Creative Commons Attribution Share Alike 4.0 International](LICENSE)
- Compatible OCaml versions: 4.13 or later
- Additional dependencies:
  - [Dune](https://dune.build) 3.17 or later
- Related publication(s): none

## Building and installation instructions

The easiest way to install the latest released version of Easy Bake CakeML - CakeML Extraction Plugin
is via [OPAM](https://opam.ocaml.org/doc/Install.html):

```shell
opam repo add coq-released https://coq.inria.fr/opam/released
opam install rocq-EasyBakeCakeML
```

To instead build and install manually, do:

``` shell
git clone https://github.com/Durbatuluk1701/EasyBakeCakeML.git
cd EasyBakeCakeML
dune build
dune install
```



