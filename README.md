# Scientific Teaching Course (demo site)

## Prerequisites

This README assumes you have completed the following [skills courses](https://skills.github.com/):

1. [Introduction to Github](https://github.com/skills/introduction-to-github)
2. [Communicate with Markdown](https://github.com/skills/communicate-using-markdown)
3. [GitHub Pages](https://github.com/skills/github-pages?tab=readme-ov-file)

## Setting up your own copy for the first time

If you want to propose several changes, complex changes, or changes that involve multiple files, you may want to make your own copy of the site so you can make, review, revise, and stage up all your changes at once:

1. [Make a copy from the original template](https://github.com/new?owner=Tiny-Earth&template_name=DocumenterSiteTemplate&template_owner=Tiny-Earth) to start from scratch, or [fork](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/fork-a-repo#forking-a-repository) the repo you are looking at to include the same content and tweaks it has
2. [Edit](https://docs.github.com/en/repositories/working-with-files/managing-files/editing-files) the `README.md` file in your copy of the project
3. Make three changes to your `site/make.jl`:
    1. Update the `sitename=...` line to change the name of your site
    2. Update the `footer=...` line to edit the copyright statement
    3. Update the `repo=...` line to use your copy's URL instead. This should be exactly like `github.com/USER-NAME/REPO-NAME.git`
4. View your project on Github and [click the Actions tab](https://docs.github.com/en/actions/monitoring-and-troubleshooting-workflows/monitoring-workflows/viewing-workflow-run-history). Confirm that the Github action compiles the site without error. If there is an error, you may need to [create and add Documenter keys to GitHub](https://m3g.github.io/JuliaNotes.jl/stable/publish_docs/#Use-DocumenterTools-to-generate-the-keys)
5. Configure your Github repo to make it available as a webpage
    1. [Set your repo's visibility to public](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/managing-repository-settings/setting-repository-visibility#changing-a-repositorys-visibility)
    2. Go to Settings / Pages and set `gh-pages` as the branch to use
    3. On your repo's homepage, click the gear next to About, and make sure `Use your GitHub Pages website` is checked
6. On your repo's homepage, click [Deployments](https://docs.github.com/en/actions/managing-workflow-runs-and-deployments/managing-deployments/viewing-deployment-history#viewing-your-repositorys-deployment-history) to confirm that your repo's website has been deployed
7. Once you've made all the changes you want to contribute back to the original copy of the site, [make a pull request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request-from-a-fork). Your changes will be reviewed by the original repo's maintainers

Otherwise, if you only have small changes to propose, it is simpler to [suggest changes directly within this repo](https://docs.github.com/en/repositories/working-with-files/managing-files/editing-files#editing-files-in-another-users-repository)

## Making changes

The important files and folders to know are:

- `site/src/` is a folder that stores `*.md` files that contain the content of the site itself. The content for the first page visitors will see is contained in `index.md`
- `site/src/assets/` is a folder that stores images used on the site
- `site/toc.yaml` stores the Table of Contents information that is used to produce the navigation bar of the website
