# (PART\*) Setup {-}

# Software installation

Welcome to the Data Challenge Lab. Our hope is that this will be a fine learning experience for you. Please complete the steps below before our first meeting. They will prepare you to use the latest versions of Git, R, and RStudio.

## Mac computers

-   Check that you have the program Applications \> Utilities \> XQuartz.
    -   If not, or if have an older version, download from the [XQuartz download site](https://www.xquartz.org) and install.
-   Xcode command line tools
    -   Run Applications \> Utilities \> Terminal.
    -   At the prompt, enter the following command followed by a return:
        -   `xcode-select --install`
    -   If the command line tools are not already installed, you will be prompted with a dialog box. Click on *Install*.
    
## GitHub

We will be using GitHub in the DCL. If you don't have a GitHub account:

-   [Create a free GitHub account](https://github.com/join?plan=free).

## Git

Git is the software we will be using to access GitHub. Follow the instructions below to download and install the latest version. Note: to avoid problems, do not install any of the Git GUI clients.

-   Mac
    -   Download from [Git download site](https://git-scm.com/downloads).
    -   Click on the downloaded .dmg file.
    -   **Right-click** on the .pkg file and select *Open*.
    -   Follow installation instructions to install.
-   Windows
    -   Download from [Git download site](https://git-scm.com/downloads) and install.
    -   Installation should include the Git Bash emulator.

## R

We will be using some new R packages that require the latest version of R. Follow the instructions below to download and install this version.

-   If you already have R installed:
    -   Before installing a new version of R, save the names of your installed packages with the command
        -   `saveRDS(rownames(installed.packages()), file = "~/packages.rds")`
-   Download the latest version of R from the [R download site](https://cloud.r-project.org/) and install.
-   If you already had R installed:
    -   Restart R to launch the new installed version.
    -   Check to see if you now have the same packages with
        -   `if (!require("dplyr")) install.packages("dplyr")`
        -   `dplyr::setequal(rownames(installed.packages()), readRDS("~/packages.rds"))`
            -   If `TRUE`, skip to last step
            -   If `FALSE`, install the missing packages from CRAN with
                -   `install.packages(dplyr::setdiff(readRDS("~/packages.rds"), rownames(installed.packages())))`
        -   `dplyr::setequal(rownames(installed.packages()), readRDS("~/packages.rds"))`
            -   If `TRUE`, skip to last step
            -   If `FALSE`, install the missing packages not from CRAN. You can see the ones that are still missing with
                -   `dplyr::setdiff(readRDS("~/packages.rds"), rownames(installed.packages()))`
    -   After you have installed all the packages you previously had, you can remove the file with the names of your installed packages with
        -   `unlink("~/packages.rds")`

## RStudio

If you don't have RStudio, or don't have the latest version:

-   Download and install the latest version of RStudio Desktop from its [download site](https://posit.co/download/rstudio-desktop/).

RStudio is constantly being updated with new features. It's a good idea to update when RStudio indicates that a new version is available.

## R packages

The power of R comes from its thousands of packages, such as the tidyverse. Follow the instructions below to install some of the packages we will be using.

-   Open up RStudio.
-   At the R prompt in the console in the lower-left corner, install the following packages with the command
    -   `install.packages(c("tidyverse", "assertthat", "babynames", "broom", "compare", "DBI", "dbplyr", "devtools", "fivethirtyeight", "flexdashboard", "fs", "ggrepel", "googlesheets4", "hexbin", "httr", "janitor", "jsonlite", "knitr", "leaflet", "nycflights13", "RPostgreSQL", "rvest", "scales", "tidycensus", "usethis", "vroom", "yaml"))`
-   Here's a description of the packages installed:
    -   [`tidyverse`](https://www.tidyverse.org/) is a collection of packages, some of which we will study in depth.
    -   `assertthat` is for making assertions within code.
    -   `babynames` is a dataset of baby names.
    -   `broom` is for working with models.
    -   `compare` will be used in exercises and challenges to compare solutions.
    -   `DBI` is for working with databases.
    -   `dbplyr` is for working with databases.
    -   `devtools` is a set of useful R development functions.
    -   `fivethirtyeight` is a dataset from the 538 blog.
    -   `flexdashboard` is for creating dashboards.
    -   `fs` is for file system operations.
    -   `ggrepel` is for automatically positioning labels in plots.
    -   `googlesheets4` is for Google Sheets data.
    -   `hexbin` is for plots with hexagonal bins.
    -   `httr` is for web APIs.
    -   `janitor` is for examining and manipulating data.
    -   `jsonlite` is for JSON data.
    -   `knitr` is for document generation.
    -   `leaflet` is for interactive maps.
    -   `nycflights13` is a dataset we will be using for the early exercises.
    -   `RPostgreSQL` is for working with the PostgreSQL database.
    -   `rvest` is for web scraping.
    -   `scales` is for scaling functions for visualization.
    -   `tidycensus` is for downloading U.S. Census data.
    -   `usethis` is for workflow tasks such as configuring your computer.
    -   `vroom` is for quickly reading and writing files.
    -   `yaml` is for YAML data.
-   Install the Data Challenge Lab (DCL) package.
    -   `remotes::install_github("stanford-datalab/dcl")`
-   Install a package with U.S. boundaries for maps
    -   `remotes::install_github("dcl-docs/ussf")`

## Update R packages

-   Open RStudio.
-   Hit the *Packages* tab in the pane in the lower-right corner, and then the *Update* button.
-   Hit the *Select All* button, and then the *Install Updates* button.
-   If you are prompted to restart your R session, select *Yes*.
-   After the installations complete, your R packages will now be up to date.
-   It's a good idea to periodically repeat this procedure to update your packages.

## Configure RStudio

-   Carefully perform the following configuration steps:
    -   Tools (on RStudio menu bar) \> Global Options...
        -   General \> Basic
            -   Workspace
                -   Restore .RData into workspace at startup: unchecked
                -   Save workspace to .RData on exit: Never
            -   History
                -   Always save history (even when not saving .RData): unchecked
            -   Other
                -   Automatically notify me of updates to RStudio: checked
        -   General \> Advanced
            -   OS Integration
                -   Rendering engine:
                    -   Mac: Auto-detect (recommended)
                    -   Windows: Desktop OpenGL
        -   Code
            -   Editing
                -   Insert spaces for tab: checked
                -   Tab width: 2
                -   Use native pipe operator, \|\> (requires R 4.1+): checked
            -   Display
                -   General
                    -   Show margin: checked
                    -   Margin column: 80
            -   Saving
                -   General
                    -   Ensure that source files end with newline: checked
            -   Diagnostics
                -   R Diagnostics
                    -   Show diagnostics for R: checked
                    -   Enable diagnostics with R function calls: checked
                    -   Provide R style diagnostics (e.g. whitespace): checked
        -   R Markdown
            -   Basic
                -   R Markdown
                    -   Show output inline for all R Markdown documents: checked
            -   Advanced
                -   Display
                    -   Show inline toolbar for R code chunks: checked
