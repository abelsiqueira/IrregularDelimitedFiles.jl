# IrregularDelimitedFiles

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://abelsiqueira.github.io/IrregularDelimitedFiles.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://abelsiqueira.github.io/IrregularDelimitedFiles.jl/dev)
[![Build Status](https://github.com/abelsiqueira/IrregularDelimitedFiles.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/abelsiqueira/IrregularDelimitedFiles.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://coveralls.io/repos/github/abelsiqueira/IrregularDelimitedFiles.jl/badge.svg?branch=main)](https://coveralls.io/github/abelsiqueira/IrregularDelimitedFiles.jl?branch=main)

_Initially developed for the [part 2 the blog post about speed up Python code with Julia](https://blog.esciencecenter.nl/speed-up-your-python-code-using-julia-f97a6c155630)._

The objective of this package is reading files like the one below:

```plaintext
1#1024
271#31,32,33,301
403#99,105
```

Characteristics:

- Unknown number of rows;
- Each row starts with a key integer (TODO: allow other numbers);
- The key is followed by a char (default `#`);
- Following after the key and char, there is an unknown number of char-separated (default `,`) integers (TODO: allow other numbers).

We have set up a [dataset](https://zenodo.org/record/5841593) of files of this type.
