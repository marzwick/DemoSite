using Documenter
using YAML

makedocs(
    sitename="DemoSite",
    # authors="Mariah A. Knowles <snotskie@gmail.com> and contributors",
    format=Documenter.HTML(assets=[
        "assets/style.css",
        "assets/script.js"
    ]),
    pages = YAML.load_file("toc.yaml")
)

deploydocs(repo="github.com/Tiny-Earth/DemoSite.git")