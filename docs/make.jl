using IrregularDelimitedFiles
using Documenter

DocMeta.setdocmeta!(IrregularDelimitedFiles, :DocTestSetup, :(using IrregularDelimitedFiles); recursive=true)

makedocs(;
    modules=[IrregularDelimitedFiles],
    authors="Abel Soares Siqueira <abel.s.siqueira@gmail.com> and contributors",
    repo="https://github.com/abelsiqueira/IrregularDelimitedFiles.jl/blob/{commit}{path}#{line}",
    sitename="IrregularDelimitedFiles.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://abelsiqueira.github.io/IrregularDelimitedFiles.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/abelsiqueira/IrregularDelimitedFiles.jl",
    devbranch="main",
)
