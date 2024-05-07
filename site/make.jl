using Documenter
using DocumenterCitations
using YAML

# Helper to get the YAML return type coverted for makedocs correctly
process(x) = x
process(x::Dict) = collect(x)
process(x::Vector) = process.(x)

# Compile the website
makedocs(
    sitename="DemoSite",
    # authors="Mariah A. Knowles <snotskie@gmail.com> and contributors", # TODO
    format=Documenter.HTML(assets=[
        "assets/style.css",
        "assets/script.js"
    ]),
    plugins=[
        CitationBibliography(joinpath(@__DIR__, "src", "refs.bib"))
    ],
    pages = collect(Iterators.flatten(process(YAML.load_file("site/toc.yaml"))))
)

# Deploy the website
deploydocs(repo="github.com/Tiny-Earth/DemoSite.git")