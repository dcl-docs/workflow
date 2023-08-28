# Project setup

## Create a project

We recommend creating one directory for each project. All your data and files for your project will live in this one directory.

Ideally, you'll organize your files in this directory in a principled way. We've created a project template with our suggested folder organization. If you haven't already, install the dcl package:


```r
# install.packages("remotes")
remotes::install_github("stanford-datalab/dcl")
```

Now, you can run


```r
dcl::create_data_project(path = "PATH/TO/PROJECT")
```

to create a directory at your supplied path with the following files and directories:

-   **data**: cleaned data
-   **data-raw**: raw data
-   **docs**: data documentation and notes
-   **eda**: exploratory data analysis on your cleaned data
-   **scripts**: data manipulation scripts
-   **reports**: findings to present to others
-   **Makefile**
-   **.gitignore**
-   **README.md**

We'll discuss how to use these directories and files in the next chapter.

By default, `dcl::create_data_project()` creates an RStudio project for the directory. If you don't want to create an RStudio project, set the `project` argument to `FALSE`:


```r
dcl::create_data_project(path = "PATH/TO/PROJECT", project = FALSE)
```

Note that it's generally a bad idea to nest RStudio projects. If you find yourself wanting to use our folder organization inside a different RStudio project, you'll probably want `project = FALSE`.

## Setup GitHub

We recommend using GitHub for all your data work. Generally, you'll want one repository per project.

Here, we'll explain how to setup Git and GitHub for your new project. The following steps will only work if you set `project = TRUE` in the previous section (they require a .Rproj file). However, if you didn't want an RStudio project for your project, you likely also don't want a GitHub repository.

### GitHub token

You will need a GitHub personal access token in order to setup Git and GitHub from RStudio. Open [GitHub](http://github.com/) in your browser. Then:

-   Click on your profile picture in the upper righthand corner, then click on *Settings*.

<img src="images/project-workflow/github-pat-1.png" width="211" style="display: block; margin: auto;" />

-   Then, go to *Developer settings* \> *Personal access tokens* \> *Tokens (classic)*.
-   Click *Generate new token*.

<img src="images/project-workflow/github-pat-2.png" width="858" style="display: block; margin: auto;" />

-   Name your token something like *RStudio* or *R*. Under *Scopes*, select *repo* (You can select other scopes if you anticipate using the GitHub API in more scenarios.)

<img src="images/project-workflow/github-pat-3.png" width="675" style="display: block; margin: auto;" />

-   Scroll down to the bottom, then click *Generate token*.

<img src="images/project-workflow/github-pat-4.png" width="118" style="display: block; margin: auto;" />

-   Copy the resulting token to your clipboard and return to RStudio.
-   From the RStudio console, open your .Renviron file with


```r
usethis::edit_r_environ()
```

-   Add the following line to your .Renviron file, replacing `YOUR_TOKEN` with the token you copied earlier.


```r
GITHUB_PAT=YOUR_TOKEN
```

-   Save the file.
-   Restart R (*Cmd/Ctrl* + *Shift* + *0*).

### `use_git()`

Now, we can create a Git repository for your project.

If you haven't already, open your project in RStudio. Then, in the console, run


```r
usethis::use_git()
```

`use_git()` will set up a Git repository for your project, then ask you if you want to make an initial commit:

<img src="images/project-workflow/use-git-1.png" width="532" style="display: block; margin: auto;" />

Enter the number that corresponds to the *Yes* option. Here, that's `3`, but it might be different for you.

Next, you'll be prompted to restart RStudio. Select the *Yes* option.

### `use_github()`

`use_git()` initializes a Git repository, but you'll still need to connect that repository to GitHub. To do so, run


```r
usethis::use_github()
```

Note that `use_github()` has multiple optional arguments that allow you to, for example, create the repository under an organization or make the repository private.

You'll be prompted for a git protocol. You'll probably want ssh.

<img src="images/project-workflow/use-github-1.png" width="548" style="display: block; margin: auto;" />

Next, you'll be prompted to verify the repository name and description. Say *Yes* unless you're unhappy with them (you can always change them later).

You might get the following error:

<img src="images/project-workflow/use-github-2.png" width="506" style="display: block; margin: auto;" />

-   If so, copy the recommended command.


```bash
git push --set-upstream origin master
```

-   Then, open Terminal, navigate to your project directory, paste in your copied command, and press enter. This command sets the default location to which `git push` will push.

-   Earlier, `use_github()` opened your GitHub repository in the browser. To see the result of your push, refresh the page. Your files should appear.

Your setup is complete! In the next chapter, we'll go into more detail about how to use the folders and makefile created by `dcl::create_data_project()`.