using Documenter
using DocumenterCitations
using YAML

# Helper to get the YAML return type coverted for makedocs correctly
process(x) = [x]
process(x::Vector) = vcat(process.(x)...)
process(x::Dict) = process.(collect(x))
process(x::Pair) = first(x) => process(last(x))
pages = process(YAML.load_file("site/toc.yaml"))

# Compile the website
makedocs(
    sitename="Scientific Teaching Course",
    # authors="Mariah A. Knowles <snotskie@gmail.com> and contributors", # TODO
    pages=pages,
    format=Documenter.HTML(
        assets=[
            "assets/style.css",
            "assets/script.js"
        ],
        footer="© 2024 The Board of Regents of the University of Wisconsin System"
    ),
    plugins=[
        CitationBibliography(
            joinpath(@__DIR__, "src", "refs.bib"),
            style=:authoryear
        )
    ]
)

# Deploy the website
deploydocs(repo="github.com/Tiny-Earth/DemoSite.git")