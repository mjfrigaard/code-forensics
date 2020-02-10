Git log analyses
================
Martin Frigaard
current version: 2020-02-10

# Motivation

This `.Rmd` file is based on the **excellent** advice in the paper,
[“Good Enough Practices for Scientific
Computing”](https://swcarpentry.github.io/good-enough-practices-in-scientific-computing/)
by Wilson et al. 

## The README, CITATION, requirements.txt, and LICENSE files

  - The `CITATION` and `LICENSE` files are created below. `CITATION`
    should contain information about how to properly cite this project.
    The `LICENSE` file will have any licensing information (`MIT`,
    `GNU`, etc.).

  - This file is the `README.Rmd`, which will create a `README.md` when
    it is knitted.

  - This document also creates a `requirements.txt` file that should
    list all dependencies for this project.

<!-- end list -->

    |-- CITATION
    |-- README.md
    |-- LICENSE
    |-- requirements.txt

``` r
# CITATION ------------------------------------------------------
if (!file.exists("CITATION")) {
    file.create("CITATION")
}

# LICENSE ------------------------------------------------------
if (!file.exists("LICENSE")) {
    file.create("LICENSE")
}

# requirements.txt ------------------------------------------------------
if (!file.exists("requirements.txt")) {
    file.create("requirements.txt")
}
```

## The CHANGELOG

The code below creates a `CHANGELOG.md` file for documenting "*dated
notes about changes to the project in this file in reverse chronological
order (i.e., most recent first). This file is the equivalent of a lab
notebook, and should contain entries like those shown below.*

The examples are included in the newly created file.

``` r
# CHANGELOG.md ------------------------------------------------------
if (!file.exists("CHANGELOG.md")) {
    file.create("CHANGELOG.md")
}
c("## 2016-04-08\n\n * Switched to cubic interpolation as default.\n* Moved question about family's TB history to end of questionnaire.\n \n## 2016-04-06\n* Added option for cubic interpolation.\n
* Removed question about staph exposure (can be inferred from blood test results).") %>% readr::write_lines( "CHANGELOG.md")
```

The paper recommends putting `CHANGELOG` in the `docs` folder, but I
like to have it more visible so visitors are more likely to review it.
This can also be named the `NEWS.md` file.

## The data, docs, code, and results folders

    |-- docs
    |-- data
    |-- results
    |-- code

These are the folders for various files in a typical project workflow.

## The data folder

This folder will store your data. The data are arguably the most
important part to an analysis, so I’ve included two articles that are
absolute necessities to good data management.

1.  [How to Share Data for
    Collaboration](https://amstat.tandfonline.com/doi/abs/10.1080/00031305.2017.1375987)
    by Shannon E. Ellis & Jeffrey T. Leek

2.  [Data Organization in
    Spreadsheets](https://www.tandfonline.com/doi/full/10.1080/00031305.2017.1375989)
    by Karl W. Broman & Kara H. Woo

These two are included in the `README.md` file in the data folder below:

#### Create data folder and README

``` r
# data ------------------------------------------------------------------
if (!file.exists("data/")) {
    dir.create("data/")
}
# data README ----
if (!file.exists("data/README.md")) {
file.create("data/README.md")
}
```

#### Add resources to data/README

This will add the resources to the `README.md` document in the `data`
folder.

``` r
data_info <- "\n\n\n# For guidance please see:\n\n# Sharing data\nhttp://bit.ly/data-4-sharing\n\n\n# Data in spreadsheets\nhttp://bit.ly/data-in-sheets\n"
# append to README.md
if (file.exists("data/README.md")) {
data_info %>% readr::write_lines("data/README.md", 
                                     append = TRUE)
}
```

  - The data folder might also have `raw` and `processed` sub-folders.

## The code

This folder is titled `src` in the paper, but I opted for the more
descriptive term `code`.

``` r
# code ------------------------------------------------------------------
if (!file.exists("code/")) {
    dir.create("code/")
}
```

`code` can mean a lot of different things, so I will reprint the section
of the paper here:

> \***Put project source code in the src directory. (4d)** `src`
> contains all of the code written for the project. This includes
> programs written in interpreted languages such as R or Python; those
> written compiled languages like Fortran, C++, or Java; as well as
> shell scripts, snippets of SQL used to pull information from
> databases; and other code needed to regenerate the results.

These are the `import`, `wrangle`, `visualize`, `model`, and
`communicate` scripts created below.

### The Scientific Guts

The code below creates the following scripts based on the `tidyverse`
workflow in the `code` folder.

    |-- code
    |   -- 01-import.R
    |   -- 02-tidy.R
    |   -- 03-wrangle.R
    |   -- 04-visualize.R
    |   -- 05-model.R
    |   -- 06-communicate.R
    |   -- runall.R

> This directory may contain two conceptually distinct types of files
> that should be distinguished either by clear file names or by
> additional sub-directories. The first type are files or groups of
> files that perform the core analysis of the research, such as data
> cleaning or statistical analyses. These files can be thought of as the
> “scientific guts” of the project.

I like to put the “scientific guts” in a `code/core/` folder, but for
this template, they are in the `code`.

``` r
# tidyverse scripts ----
if (!file.exists(c("./code/01-import.R", "./code/02-tidy.R", 
                   "./code/03-wrangle.R", "./code/04-visualize.R",
                   "./code/05-model.R", "./code/06-communicate.R",
                   "./code/runall.R"))) {
    file.create(c("./code/01-import.R", "./code/02-tidy.R", 
                   "./code/03-wrangle.R", "./code/04-visualize.R",
                   "./code/05-model.R", "./code/06-communicate.R",
                  "./code/runall.R"))
}
```

#### Script headers

This is an optional code chunk (it is set to `eval = FALSE`, so you’ll
have to run it manually or change to `eval = TRUE`) that adds the
following script header to the `runall.R` file.

``` r
#=====================================================================#
# This is code to create:
# Authored by and feedback to:
# MIT License
# Version:
#=====================================================================#
```

``` r
script_headers <- c("#=====================================================================#\n# This is code to create:\n# Authored by and feedback to:\n# MIT License\n# Version:\n#=====================================================================#\n")
```

``` r
# add to 01-import.R
script_headers %>% readr::write_lines("./code/01-import.R")
# add to 02-tidy.R
script_headers %>% readr::write_lines("./code/02-tidy.R")
# add to 03-wrangle.R
script_headers %>% readr::write_lines( "./code/03-wrangle.R")
# add to 04-visualize.R
script_headers %>% readr::write_lines( "./code/04-visualize.R")
# add to 05-model.R
script_headers %>% readr::write_lines( "./code/05-model.R")
# add to 06-communicate.R
script_headers %>% readr::write_lines( "./code/06-communicate.R")
```

> The second type of file in `src` is controller or driver scripts that
> that contains all the analysis steps for the entire project from start
> to finish, with particular parameters and data input/output commands.
> A controller script for a simple project, for example, may read a raw
> data table, import and apply several cleanup and analysis functions
> from the other files in this directory, and create and save a numeric
> result. For a small project with one main output, a single controller
> script should be placed in the main src directory and distinguished
> clearly by a name such as “`runall`”. The short example in Figure
> \[fig:script\] is typical of scripts of this kind; note how it uses
> one variable, TEMP\_DIR, to avoid repeating the name of a particular
> directory four times.

The controller script is created in the code folder as, `runall.R`.

``` r
if (!file.exists("./code/runall.R")) {
    file.create("./code/runall.R")
}
```

Below is a header for the `runall.R` script.

``` r
#=====================================================================#

# The controller script: A controller script for a simple project, for example,
# may read a raw data table, import and apply several cleanup and analysis
# functions from the other files in this directory, and create and save a
# numeric result.

# TEMP_DIR = ./temp_zip_files/

# echo 'Packaging zip files required by analysis tool...'
# mkdir $(TEMP_DIR)
# ./src/make-zip-files.py $(TEMP_DIR) *.dat

# echo 'Analyzing...'
# ./bin/sqr_mean_analyze -i $(TEMP_DIR) -b 'temp'

# echo 'Cleaning up...'
# rm -rf $(TEMP_DIR)

#=====================================================================#
```

``` r
c("#=====================================================================#\n\n# The controller script: A controller script for a simple project, for example,\n# may read a raw data table, import and apply several cleanup and analysis\n# functions from the other files in this directory, and create and save a\n# numeric result.\n\n# TEMP_DIR = ./temp_zip_files/\n\n# echo 'Packaging zip files required by analysis tool...'\n# mkdir $(TEMP_DIR)\n# ./src/make-zip-files.py $(TEMP_DIR) *.dat\n\n# echo 'Analyzing...'\n# ./bin/sqr_mean_analyze -i $(TEMP_DIR) -b 'temp'\n\n# echo 'Cleaning up...'\n# rm -rf $(TEMP_DIR)\n\n#=====================================================================#") %>% 
    readr::write_lines("./code/runall.R")
```

## The results

These are visualizations, model outputs, etc. I also create a
`results/README.md` file

``` r
# results ------------------------------------------------------------------
if (!file.exists("results/")) {
    dir.create("results/")
}
# results README
if (!file.exists("results/README.md")) {
    file.create("results/README.md")
}
```

    #>  [1] TRUE

The `results` folder could be renamed `output` (and could have a
`figures` or `images` sub folder).

Below is a header with some information from the paper on what kinds of
data go in `results` (vs. `data`).

``` mdown
Results notes:
===================

> Put raw data and metadata in a `data` directory, and files generated during
> cleanup and analysis in a `results` directory.
```

``` r
results_info <- c("Results notes:\n===================\n\n> Put raw data and metadata in a `data` directory, and files generated during\n> cleanup and analysis in a `results` directory.")
if (file.exists("results/README.md")) {
results_info %>% readr::write_lines("results/README.md", 
                                     append = TRUE)
}
```

### The `doc` folder

> The `doc` directory contains two text files written in Markdown, one
> containing a running lab notebook describing various ideas for the
> project and how these were implemented and the other containing a
> running draft of a manuscript describing the project findings.

``` r
# docs ------------------------------------------------------------------
if (!file.exists("doc/")) {
    dir.create("doc/")
}
# doc files -------
if (!file.exists(c("./doc/lab-notes.md", "./doc/project-manuscript.md"))) {
    file.create(c("./doc/lab-notes.md", "./doc/project-manuscript.md"))
}
```

Feel free to add more specific sub-folders as needed.

## Verify the new folder structure

The `fs::dir_tree()` function gives us a nice overview of the
accompanying files.

``` r
fs::dir_tree(".")
```

    #>  .
    #>  ├── 01.0-git-file-changes-R.Rmd
    #>  ├── 02.0-git-author-data-R.Rmd
    #>  ├── 03.1-tidy-git-analysis-jackson.Rmd
    #>  ├── 03.2-gh-purrr-package-byran.Rmd
    #>  ├── CHANGELOG.md
    #>  ├── CITATION
    #>  ├── EXAMPLES.md
    #>  ├── LICENSE
    #>  ├── README.Rmd
    #>  ├── code
    #>  │   ├── 01-import.R
    #>  │   ├── 02-tidy.R
    #>  │   ├── 03-wrangle.R
    #>  │   ├── 04-visualize.R
    #>  │   ├── 05-model.R
    #>  │   ├── 06-communicate.R
    #>  │   └── runall.R
    #>  ├── data
    #>  │   ├── 2020-01-15-GitFileCount.csv
    #>  │   ├── 2020-01-15-author_summary.txt
    #>  │   ├── 2020-01-15-file_name_counts.txt
    #>  │   └── README.md
    #>  ├── doc
    #>  │   ├── lab-notes.md
    #>  │   └── project-manuscript.md
    #>  ├── docs
    #>  │   └── git-log-documentation.pdf
    #>  ├── downloads
    #>  │   ├── dplyr
    #>  │   │   ├── DESCRIPTION
    #>  │   │   ├── Doxyfile
    #>  │   │   ├── LICENSE
    #>  │   │   ├── LICENSE.md
    #>  │   │   ├── NAMESPACE
    #>  │   │   ├── NEWS.md
    #>  │   │   ├── R
    #>  │   │   │   ├── across.R
    #>  │   │   │   ├── all-equal.r
    #>  │   │   │   ├── arrange.R
    #>  │   │   │   ├── bind.r
    #>  │   │   │   ├── case_when.R
    #>  │   │   │   ├── coalesce.R
    #>  │   │   │   ├── colwise-arrange.R
    #>  │   │   │   ├── colwise-distinct.R
    #>  │   │   │   ├── colwise-filter.R
    #>  │   │   │   ├── colwise-funs.R
    #>  │   │   │   ├── colwise-group-by.R
    #>  │   │   │   ├── colwise-mutate.R
    #>  │   │   │   ├── colwise-select.R
    #>  │   │   │   ├── colwise.R
    #>  │   │   │   ├── compat-dbplyr.R
    #>  │   │   │   ├── compat-future-group_by.R
    #>  │   │   │   ├── compat-lazyeval.R
    #>  │   │   │   ├── compat-name-repair.R
    #>  │   │   │   ├── compat-purrr.R
    #>  │   │   │   ├── compute-collect.r
    #>  │   │   │   ├── conditions.R
    #>  │   │   │   ├── context.R
    #>  │   │   │   ├── copy-to.r
    #>  │   │   │   ├── count-tally.R
    #>  │   │   │   ├── data-bands.R
    #>  │   │   │   ├── data-starwars.R
    #>  │   │   │   ├── data-storms.R
    #>  │   │   │   ├── dataframe.R
    #>  │   │   │   ├── dbplyr.R
    #>  │   │   │   ├── defunct.r
    #>  │   │   │   ├── deprec-bench-compare.r
    #>  │   │   │   ├── deprec-combine.R
    #>  │   │   │   ├── deprec-funs.R
    #>  │   │   │   ├── deprec-lazyeval.R
    #>  │   │   │   ├── deprec-location.R
    #>  │   │   │   ├── deprec-src-local.r
    #>  │   │   │   ├── deprec-tibble.R
    #>  │   │   │   ├── deprec-tidyselect.R
    #>  │   │   │   ├── desc.r
    #>  │   │   │   ├── distinct.R
    #>  │   │   │   ├── do.r
    #>  │   │   │   ├── doc-methods.R
    #>  │   │   │   ├── doc-params.R
    #>  │   │   │   ├── dplyr.r
    #>  │   │   │   ├── error.R
    #>  │   │   │   ├── explain.r
    #>  │   │   │   ├── filter.R
    #>  │   │   │   ├── funs-predicates.R
    #>  │   │   │   ├── funs.R
    #>  │   │   │   ├── generics.R
    #>  │   │   │   ├── group-by.r
    #>  │   │   │   ├── group_data.R
    #>  │   │   │   ├── group_map.R
    #>  │   │   │   ├── group_nest.R
    #>  │   │   │   ├── group_split.R
    #>  │   │   │   ├── group_trim.R
    #>  │   │   │   ├── grouped-df.r
    #>  │   │   │   ├── groups-with.R
    #>  │   │   │   ├── helper-error-msg.R
    #>  │   │   │   ├── if_else.R
    #>  │   │   │   ├── join-cols.R
    #>  │   │   │   ├── join-common-by.R
    #>  │   │   │   ├── join-rows.R
    #>  │   │   │   ├── join.r
    #>  │   │   │   ├── lead-lag.R
    #>  │   │   │   ├── mutate.R
    #>  │   │   │   ├── na_if.R
    #>  │   │   │   ├── near.R
    #>  │   │   │   ├── nth-value.R
    #>  │   │   │   ├── order-by.R
    #>  │   │   │   ├── progress.R
    #>  │   │   │   ├── pull.R
    #>  │   │   │   ├── rank.R
    #>  │   │   │   ├── rbind.R
    #>  │   │   │   ├── recode.R
    #>  │   │   │   ├── reexport-tibble.r
    #>  │   │   │   ├── reexport-tidyselect.R
    #>  │   │   │   ├── rename.R
    #>  │   │   │   ├── rowwise.r
    #>  │   │   │   ├── sample.R
    #>  │   │   │   ├── select.R
    #>  │   │   │   ├── sets.r
    #>  │   │   │   ├── slice.R
    #>  │   │   │   ├── src.r
    #>  │   │   │   ├── src_dbi.R
    #>  │   │   │   ├── summarise.R
    #>  │   │   │   ├── tbl-df.r
    #>  │   │   │   ├── tbl.r
    #>  │   │   │   ├── top-n.R
    #>  │   │   │   ├── ts.R
    #>  │   │   │   ├── utils-expr.R
    #>  │   │   │   ├── utils-format.r
    #>  │   │   │   ├── utils-replace-with.R
    #>  │   │   │   ├── utils-tidy-eval.R
    #>  │   │   │   ├── utils.r
    #>  │   │   │   └── zzz.r
    #>  │   │   ├── README.Rmd
    #>  │   │   ├── README.md
    #>  │   │   ├── _pkgdown.yml
    #>  │   │   ├── archive
    #>  │   │   │   ├── 0.5.0-earliest
    #>  │   │   │   │   └── packrat
    #>  │   │   │   │       ├── init.R
    #>  │   │   │   │       ├── packrat.lock
    #>  │   │   │   │       └── packrat.opts
    #>  │   │   │   ├── 0.5.0-latest
    #>  │   │   │   │   └── packrat
    #>  │   │   │   │       ├── init.R
    #>  │   │   │   │       ├── packrat.lock
    #>  │   │   │   │       └── packrat.opts
    #>  │   │   │   ├── 0.7.0-earliest
    #>  │   │   │   │   └── packrat
    #>  │   │   │   │       ├── init.R
    #>  │   │   │   │       ├── packrat.lock
    #>  │   │   │   │       └── packrat.opts
    #>  │   │   │   ├── 0.7.0-latest
    #>  │   │   │   │   └── packrat
    #>  │   │   │   │       ├── init.R
    #>  │   │   │   │       ├── packrat.lock
    #>  │   │   │   │       └── packrat.opts
    #>  │   │   │   ├── 0.7.1-earliest
    #>  │   │   │   │   └── packrat
    #>  │   │   │   │       ├── init.R
    #>  │   │   │   │       ├── packrat.lock
    #>  │   │   │   │       └── packrat.opts
    #>  │   │   │   ├── 0.7.1-latest
    #>  │   │   │   │   └── packrat
    #>  │   │   │   │       ├── init.R
    #>  │   │   │   │       ├── packrat.lock
    #>  │   │   │   │       └── packrat.opts
    #>  │   │   │   ├── 0.7.2-earliest
    #>  │   │   │   │   └── packrat
    #>  │   │   │   │       ├── init.R
    #>  │   │   │   │       ├── packrat.lock
    #>  │   │   │   │       └── packrat.opts
    #>  │   │   │   ├── 0.7.2-latest
    #>  │   │   │   │   └── packrat
    #>  │   │   │   │       ├── init.R
    #>  │   │   │   │       ├── packrat.lock
    #>  │   │   │   │       └── packrat.opts
    #>  │   │   │   ├── 0.7.3-earliest
    #>  │   │   │   │   └── packrat
    #>  │   │   │   │       ├── init.R
    #>  │   │   │   │       ├── packrat.lock
    #>  │   │   │   │       └── packrat.opts
    #>  │   │   │   ├── 0.7.3-latest
    #>  │   │   │   │   └── packrat
    #>  │   │   │   │       ├── init.R
    #>  │   │   │   │       ├── packrat.lock
    #>  │   │   │   │       └── packrat.opts
    #>  │   │   │   ├── 0.7.4-current
    #>  │   │   │   │   └── packrat
    #>  │   │   │   │       ├── init.R
    #>  │   │   │   │       ├── packrat.lock
    #>  │   │   │   │       └── packrat.opts
    #>  │   │   │   ├── 0.7.4-earliest
    #>  │   │   │   │   └── packrat
    #>  │   │   │   │       ├── init.R
    #>  │   │   │   │       ├── packrat.lock
    #>  │   │   │   │       └── packrat.opts
    #>  │   │   │   ├── README.md
    #>  │   │   │   ├── add-version.sh
    #>  │   │   │   ├── run-all.sh
    #>  │   │   │   └── run-in.sh
    #>  │   │   ├── codecov.yml
    #>  │   │   ├── cran-comments.md
    #>  │   │   ├── data
    #>  │   │   │   ├── band_instruments.rda
    #>  │   │   │   ├── band_instruments2.rda
    #>  │   │   │   ├── band_members.rda
    #>  │   │   │   ├── starwars.rda
    #>  │   │   │   └── storms.rda
    #>  │   │   ├── data-raw
    #>  │   │   │   ├── band_members.R
    #>  │   │   │   ├── starwars.R
    #>  │   │   │   ├── starwars.csv
    #>  │   │   │   └── storms.R
    #>  │   │   ├── dplyr.Rproj
    #>  │   │   ├── inst
    #>  │   │   │   ├── bench
    #>  │   │   │   │   ├── bench-mean.R
    #>  │   │   │   │   └── bench.R
    #>  │   │   │   └── db
    #>  │   │   ├── man
    #>  │   │   │   ├── across.Rd
    #>  │   │   │   ├── add_rownames.Rd
    #>  │   │   │   ├── all_equal.Rd
    #>  │   │   │   ├── all_vars.Rd
    #>  │   │   │   ├── arrange.Rd
    #>  │   │   │   ├── arrange_all.Rd
    #>  │   │   │   ├── auto_copy.Rd
    #>  │   │   │   ├── backend_dbplyr.Rd
    #>  │   │   │   ├── band_members.Rd
    #>  │   │   │   ├── bench_compare.Rd
    #>  │   │   │   ├── between.Rd
    #>  │   │   │   ├── bind.Rd
    #>  │   │   │   ├── case_when.Rd
    #>  │   │   │   ├── check_dbplyr.Rd
    #>  │   │   │   ├── coalesce.Rd
    #>  │   │   │   ├── combine.Rd
    #>  │   │   │   ├── common_by.Rd
    #>  │   │   │   ├── compute.Rd
    #>  │   │   │   ├── context.Rd
    #>  │   │   │   ├── copy_to.Rd
    #>  │   │   │   ├── cumall.Rd
    #>  │   │   │   ├── defunct.Rd
    #>  │   │   │   ├── desc.Rd
    #>  │   │   │   ├── dim_desc.Rd
    #>  │   │   │   ├── distinct.Rd
    #>  │   │   │   ├── distinct_all.Rd
    #>  │   │   │   ├── do.Rd
    #>  │   │   │   ├── dplyr-package.Rd
    #>  │   │   │   ├── dplyr_extending.Rd
    #>  │   │   │   ├── dplyr_tidy_eval.Rd
    #>  │   │   │   ├── dplyr_tidy_select.Rd
    #>  │   │   │   ├── explain.Rd
    #>  │   │   │   ├── figures
    #>  │   │   │   │   ├── lifecycle-archived.svg
    #>  │   │   │   │   ├── lifecycle-defunct.svg
    #>  │   │   │   │   ├── lifecycle-deprecated.svg
    #>  │   │   │   │   ├── lifecycle-experimental.svg
    #>  │   │   │   │   ├── lifecycle-maturing.svg
    #>  │   │   │   │   ├── lifecycle-questioning.svg
    #>  │   │   │   │   ├── lifecycle-retired.svg
    #>  │   │   │   │   ├── lifecycle-soft-deprecated.svg
    #>  │   │   │   │   ├── lifecycle-stable.svg
    #>  │   │   │   │   └── logo.png
    #>  │   │   │   ├── filter-joins.Rd
    #>  │   │   │   ├── filter.Rd
    #>  │   │   │   ├── filter_all.Rd
    #>  │   │   │   ├── funs.Rd
    #>  │   │   │   ├── group_by.Rd
    #>  │   │   │   ├── group_by_all.Rd
    #>  │   │   │   ├── group_by_drop_default.Rd
    #>  │   │   │   ├── group_by_prepare.Rd
    #>  │   │   │   ├── group_cols.Rd
    #>  │   │   │   ├── group_data.Rd
    #>  │   │   │   ├── group_map.Rd
    #>  │   │   │   ├── group_nest.Rd
    #>  │   │   │   ├── group_split.Rd
    #>  │   │   │   ├── group_trim.Rd
    #>  │   │   │   ├── grouped_df.Rd
    #>  │   │   │   ├── ident.Rd
    #>  │   │   │   ├── if_else.Rd
    #>  │   │   │   ├── lead-lag.Rd
    #>  │   │   │   ├── location.Rd
    #>  │   │   │   ├── make_tbl.Rd
    #>  │   │   │   ├── mutate-joins.Rd
    #>  │   │   │   ├── mutate.Rd
    #>  │   │   │   ├── mutate_all.Rd
    #>  │   │   │   ├── n_distinct.Rd
    #>  │   │   │   ├── na_if.Rd
    #>  │   │   │   ├── near.Rd
    #>  │   │   │   ├── nest_join.Rd
    #>  │   │   │   ├── new_grouped_df.Rd
    #>  │   │   │   ├── nth.Rd
    #>  │   │   │   ├── order_by.Rd
    #>  │   │   │   ├── progress_estimated.Rd
    #>  │   │   │   ├── pull.Rd
    #>  │   │   │   ├── ranking.Rd
    #>  │   │   │   ├── recode.Rd
    #>  │   │   │   ├── reexports.Rd
    #>  │   │   │   ├── rename.Rd
    #>  │   │   │   ├── rowwise.Rd
    #>  │   │   │   ├── same_src.Rd
    #>  │   │   │   ├── sample_n.Rd
    #>  │   │   │   ├── scoped.Rd
    #>  │   │   │   ├── se-deprecated.Rd
    #>  │   │   │   ├── select.Rd
    #>  │   │   │   ├── select_all.Rd
    #>  │   │   │   ├── select_vars.Rd
    #>  │   │   │   ├── setops.Rd
    #>  │   │   │   ├── slice.Rd
    #>  │   │   │   ├── sql.Rd
    #>  │   │   │   ├── src.Rd
    #>  │   │   │   ├── src_dbi.Rd
    #>  │   │   │   ├── src_local.Rd
    #>  │   │   │   ├── src_tbls.Rd
    #>  │   │   │   ├── starwars.Rd
    #>  │   │   │   ├── storms.Rd
    #>  │   │   │   ├── summarise.Rd
    #>  │   │   │   ├── summarise_all.Rd
    #>  │   │   │   ├── summarise_each.Rd
    #>  │   │   │   ├── tally.Rd
    #>  │   │   │   ├── tbl.Rd
    #>  │   │   │   ├── tbl_df.Rd
    #>  │   │   │   ├── tbl_ptype.Rd
    #>  │   │   │   ├── tbl_vars.Rd
    #>  │   │   │   ├── tidyeval-compat.Rd
    #>  │   │   │   ├── top_n.Rd
    #>  │   │   │   ├── vars.Rd
    #>  │   │   │   ├── with_groups.Rd
    #>  │   │   │   └── with_order.Rd
    #>  │   │   ├── pkgdown
    #>  │   │   │   └── favicon
    #>  │   │   │       ├── apple-touch-icon-120x120.png
    #>  │   │   │       ├── apple-touch-icon-152x152.png
    #>  │   │   │       ├── apple-touch-icon-180x180.png
    #>  │   │   │       ├── apple-touch-icon-60x60.png
    #>  │   │   │       ├── apple-touch-icon-76x76.png
    #>  │   │   │       ├── apple-touch-icon.png
    #>  │   │   │       ├── favicon-16x16.png
    #>  │   │   │       ├── favicon-32x32.png
    #>  │   │   │       └── favicon.ico
    #>  │   │   ├── revdep
    #>  │   │   │   ├── README.md
    #>  │   │   │   ├── check.R
    #>  │   │   │   ├── cran.md
    #>  │   │   │   ├── drake-analyze.R
    #>  │   │   │   ├── drake-base.R
    #>  │   │   │   ├── drake-deps.R
    #>  │   │   │   ├── drake.R
    #>  │   │   │   ├── email.md
    #>  │   │   │   ├── email.yml
    #>  │   │   │   ├── failures.md
    #>  │   │   │   ├── new-problems.md
    #>  │   │   │   ├── problems.md
    #>  │   │   │   └── revdep_dplyr0.8.4.md
    #>  │   │   ├── src
    #>  │   │   │   ├── conditions.cpp
    #>  │   │   │   ├── dplyr.h
    #>  │   │   │   ├── filter.cpp
    #>  │   │   │   ├── funs.cpp
    #>  │   │   │   ├── group_by.cpp
    #>  │   │   │   ├── group_data.cpp
    #>  │   │   │   ├── imports.cpp
    #>  │   │   │   ├── init.cpp
    #>  │   │   │   ├── mutate.cpp
    #>  │   │   │   ├── slice.cpp
    #>  │   │   │   └── summarise.cpp
    #>  │   │   ├── tests
    #>  │   │   │   ├── testthat
    #>  │   │   │   │   ├── helper-dplyr.R
    #>  │   │   │   │   ├── helper-encoding.R
    #>  │   │   │   │   ├── helper-torture.R
    #>  │   │   │   │   ├── test-DBI.R
    #>  │   │   │   │   ├── test-across.R
    #>  │   │   │   │   ├── test-all-equal.r
    #>  │   │   │   │   ├── test-arrange-errors.txt
    #>  │   │   │   │   ├── test-arrange.r
    #>  │   │   │   │   ├── test-between.R
    #>  │   │   │   │   ├── test-binds-errors.txt
    #>  │   │   │   │   ├── test-binds.R
    #>  │   │   │   │   ├── test-case-when-errors.txt
    #>  │   │   │   │   ├── test-case-when.R
    #>  │   │   │   │   ├── test-coalesce-errors.txt
    #>  │   │   │   │   ├── test-coalesce.R
    #>  │   │   │   │   ├── test-colwise-arrange.R
    #>  │   │   │   │   ├── test-colwise-distinct.R
    #>  │   │   │   │   ├── test-colwise-errors.txt
    #>  │   │   │   │   ├── test-colwise-filter-errors.txt
    #>  │   │   │   │   ├── test-colwise-filter.R
    #>  │   │   │   │   ├── test-colwise-funs.R
    #>  │   │   │   │   ├── test-colwise-group-by.R
    #>  │   │   │   │   ├── test-colwise-mutate-errors.txt
    #>  │   │   │   │   ├── test-colwise-mutate.R
    #>  │   │   │   │   ├── test-colwise-select-errors.txt
    #>  │   │   │   │   ├── test-colwise-select.R
    #>  │   │   │   │   ├── test-colwise.R
    #>  │   │   │   │   ├── test-context-error.txt
    #>  │   │   │   │   ├── test-context.R
    #>  │   │   │   │   ├── test-count-tally-errors.txt
    #>  │   │   │   │   ├── test-count-tally.r
    #>  │   │   │   │   ├── test-deprec-combine-errors.txt
    #>  │   │   │   │   ├── test-deprec-combine.R
    #>  │   │   │   │   ├── test-deprec-funs-errors.txt
    #>  │   │   │   │   ├── test-deprec-funs.R
    #>  │   │   │   │   ├── test-deprec-lazyeval.R
    #>  │   │   │   │   ├── test-deprec-src-local-errors.txt
    #>  │   │   │   │   ├── test-deprec-src-local.r
    #>  │   │   │   │   ├── test-deprec-tibble.R
    #>  │   │   │   │   ├── test-distinct-errors.txt
    #>  │   │   │   │   ├── test-distinct.R
    #>  │   │   │   │   ├── test-do-errors.txt
    #>  │   │   │   │   ├── test-do.R
    #>  │   │   │   │   ├── test-empty-groups.R
    #>  │   │   │   │   ├── test-equality-errors.txt
    #>  │   │   │   │   ├── test-filter-errors.txt
    #>  │   │   │   │   ├── test-filter.r
    #>  │   │   │   │   ├── test-funs-predicates-errors.txt
    #>  │   │   │   │   ├── test-funs-predicates.R
    #>  │   │   │   │   ├── test-generics.R
    #>  │   │   │   │   ├── test-group-by-errors.txt
    #>  │   │   │   │   ├── test-group-by.r
    #>  │   │   │   │   ├── test-group_data-errors.txt
    #>  │   │   │   │   ├── test-group_data.R
    #>  │   │   │   │   ├── test-group_map-errors.txt
    #>  │   │   │   │   ├── test-group_map.R
    #>  │   │   │   │   ├── test-group_nest.R
    #>  │   │   │   │   ├── test-group_split.R
    #>  │   │   │   │   ├── test-group_trim.R
    #>  │   │   │   │   ├── test-grouped-df-errors.txt
    #>  │   │   │   │   ├── test-grouped-df.r
    #>  │   │   │   │   ├── test-groups-with.R
    #>  │   │   │   │   ├── test-if-else-errors.txt
    #>  │   │   │   │   ├── test-if-else.R
    #>  │   │   │   │   ├── test-join-cols.R
    #>  │   │   │   │   ├── test-join-cols.txt
    #>  │   │   │   │   ├── test-join-rows.R
    #>  │   │   │   │   ├── test-join.r
    #>  │   │   │   │   ├── test-lead-lag-errors.txt
    #>  │   │   │   │   ├── test-lead-lag.R
    #>  │   │   │   │   ├── test-mutate-errors.txt
    #>  │   │   │   │   ├── test-mutate-windowed.R
    #>  │   │   │   │   ├── test-mutate.r
    #>  │   │   │   │   ├── test-n-distinct-errors.txt
    #>  │   │   │   │   ├── test-n_distinct.R
    #>  │   │   │   │   ├── test-na-if-errors.txt
    #>  │   │   │   │   ├── test-na-if.R
    #>  │   │   │   │   ├── test-near.R
    #>  │   │   │   │   ├── test-nth-value.R
    #>  │   │   │   │   ├── test-order-by-errors.txt
    #>  │   │   │   │   ├── test-order-by.R
    #>  │   │   │   │   ├── test-pull.R
    #>  │   │   │   │   ├── test-rank.R
    #>  │   │   │   │   ├── test-rbind.R
    #>  │   │   │   │   ├── test-recode-errors.txt
    #>  │   │   │   │   ├── test-recode.R
    #>  │   │   │   │   ├── test-rename.R
    #>  │   │   │   │   ├── test-sample-errors.txt
    #>  │   │   │   │   ├── test-sample.R
    #>  │   │   │   │   ├── test-select.r
    #>  │   │   │   │   ├── test-sets-errors.txt
    #>  │   │   │   │   ├── test-sets.R
    #>  │   │   │   │   ├── test-slice-errors.txt
    #>  │   │   │   │   ├── test-slice.r
    #>  │   │   │   │   ├── test-src_dbi-errors.txt
    #>  │   │   │   │   ├── test-src_dbi.R
    #>  │   │   │   │   ├── test-summarise-errors.txt
    #>  │   │   │   │   ├── test-summarise.r
    #>  │   │   │   │   ├── test-tbl.R
    #>  │   │   │   │   ├── test-top-n.R
    #>  │   │   │   │   ├── test-transmute.R
    #>  │   │   │   │   ├── test-union-all.R
    #>  │   │   │   │   ├── test-utils-errors.txt
    #>  │   │   │   │   ├── test-utils.R
    #>  │   │   │   │   ├── test-window-errors.txt
    #>  │   │   │   │   ├── test-window.R
    #>  │   │   │   │   └── utf-8.txt
    #>  │   │   │   └── testthat.R
    #>  │   │   └── vignettes
    #>  │   │       ├── compatibility.Rmd
    #>  │   │       ├── dplyr.Rmd
    #>  │   │       ├── future
    #>  │   │       │   └── dplyr_0.8.0.Rmd
    #>  │   │       ├── programming.Rmd
    #>  │   │       ├── two-table.Rmd
    #>  │   │       └── window-functions.Rmd
    #>  │   └── ggplot2
    #>  │       ├── CODE_OF_CONDUCT.md
    #>  │       ├── CONTRIBUTING.md
    #>  │       ├── DESCRIPTION
    #>  │       ├── GOVERNANCE.md
    #>  │       ├── ISSUE_TEMPLATE.md
    #>  │       ├── LICENSE
    #>  │       ├── LICENSE.md
    #>  │       ├── NAMESPACE
    #>  │       ├── NEWS
    #>  │       ├── NEWS.md
    #>  │       ├── R
    #>  │       │   ├── aaa-.r
    #>  │       │   ├── aes-colour-fill-alpha.r
    #>  │       │   ├── aes-evaluation.r
    #>  │       │   ├── aes-group-order.r
    #>  │       │   ├── aes-linetype-size-shape.r
    #>  │       │   ├── aes-position.r
    #>  │       │   ├── aes.r
    #>  │       │   ├── annotation-custom.r
    #>  │       │   ├── annotation-logticks.r
    #>  │       │   ├── annotation-map.r
    #>  │       │   ├── annotation-raster.r
    #>  │       │   ├── annotation.r
    #>  │       │   ├── autolayer.r
    #>  │       │   ├── autoplot.r
    #>  │       │   ├── axis-secondary.R
    #>  │       │   ├── backports.R
    #>  │       │   ├── bench.r
    #>  │       │   ├── bin.R
    #>  │       │   ├── compat-plyr.R
    #>  │       │   ├── coord-.r
    #>  │       │   ├── coord-cartesian-.r
    #>  │       │   ├── coord-fixed.r
    #>  │       │   ├── coord-flip.r
    #>  │       │   ├── coord-map.r
    #>  │       │   ├── coord-munch.r
    #>  │       │   ├── coord-polar.r
    #>  │       │   ├── coord-quickmap.R
    #>  │       │   ├── coord-sf.R
    #>  │       │   ├── coord-transform.r
    #>  │       │   ├── data.R
    #>  │       │   ├── facet-.r
    #>  │       │   ├── facet-grid-.r
    #>  │       │   ├── facet-null.r
    #>  │       │   ├── facet-wrap.r
    #>  │       │   ├── fortify-lm.r
    #>  │       │   ├── fortify-map.r
    #>  │       │   ├── fortify-multcomp.r
    #>  │       │   ├── fortify-spatial.r
    #>  │       │   ├── fortify.r
    #>  │       │   ├── geom-.r
    #>  │       │   ├── geom-abline.r
    #>  │       │   ├── geom-bar.r
    #>  │       │   ├── geom-bin2d.r
    #>  │       │   ├── geom-blank.r
    #>  │       │   ├── geom-boxplot.r
    #>  │       │   ├── geom-col.r
    #>  │       │   ├── geom-contour.r
    #>  │       │   ├── geom-count.r
    #>  │       │   ├── geom-crossbar.r
    #>  │       │   ├── geom-curve.r
    #>  │       │   ├── geom-defaults.r
    #>  │       │   ├── geom-density.r
    #>  │       │   ├── geom-density2d.r
    #>  │       │   ├── geom-dotplot.r
    #>  │       │   ├── geom-errorbar.r
    #>  │       │   ├── geom-errorbarh.r
    #>  │       │   ├── geom-freqpoly.r
    #>  │       │   ├── geom-hex.r
    #>  │       │   ├── geom-histogram.r
    #>  │       │   ├── geom-hline.r
    #>  │       │   ├── geom-jitter.r
    #>  │       │   ├── geom-label.R
    #>  │       │   ├── geom-linerange.r
    #>  │       │   ├── geom-map.r
    #>  │       │   ├── geom-path.r
    #>  │       │   ├── geom-point.r
    #>  │       │   ├── geom-pointrange.r
    #>  │       │   ├── geom-polygon.r
    #>  │       │   ├── geom-quantile.r
    #>  │       │   ├── geom-raster.r
    #>  │       │   ├── geom-rect.r
    #>  │       │   ├── geom-ribbon.r
    #>  │       │   ├── geom-rug.r
    #>  │       │   ├── geom-segment.r
    #>  │       │   ├── geom-sf.R
    #>  │       │   ├── geom-smooth.r
    #>  │       │   ├── geom-spoke.r
    #>  │       │   ├── geom-text.r
    #>  │       │   ├── geom-tile.r
    #>  │       │   ├── geom-violin.r
    #>  │       │   ├── geom-vline.r
    #>  │       │   ├── ggplot-global.R
    #>  │       │   ├── ggplot2.r
    #>  │       │   ├── ggproto.r
    #>  │       │   ├── grob-absolute.r
    #>  │       │   ├── grob-dotstack.r
    #>  │       │   ├── grob-null.r
    #>  │       │   ├── grouping.r
    #>  │       │   ├── guide-bins.R
    #>  │       │   ├── guide-colorbar.r
    #>  │       │   ├── guide-colorsteps.R
    #>  │       │   ├── guide-legend.r
    #>  │       │   ├── guides-.r
    #>  │       │   ├── guides-axis.r
    #>  │       │   ├── guides-grid.r
    #>  │       │   ├── guides-none.r
    #>  │       │   ├── hexbin.R
    #>  │       │   ├── labeller.r
    #>  │       │   ├── labels.r
    #>  │       │   ├── layer-sf.R
    #>  │       │   ├── layer.r
    #>  │       │   ├── layout.R
    #>  │       │   ├── legend-draw.r
    #>  │       │   ├── limits.r
    #>  │       │   ├── margins.R
    #>  │       │   ├── performance.R
    #>  │       │   ├── plot-build.r
    #>  │       │   ├── plot-construction.r
    #>  │       │   ├── plot-last.r
    #>  │       │   ├── plot.r
    #>  │       │   ├── position-.r
    #>  │       │   ├── position-collide.r
    #>  │       │   ├── position-dodge.r
    #>  │       │   ├── position-dodge2.r
    #>  │       │   ├── position-identity.r
    #>  │       │   ├── position-jitter.r
    #>  │       │   ├── position-jitterdodge.R
    #>  │       │   ├── position-nudge.R
    #>  │       │   ├── position-stack.r
    #>  │       │   ├── quick-plot.r
    #>  │       │   ├── range.r
    #>  │       │   ├── reshape-add-margins.R
    #>  │       │   ├── save.r
    #>  │       │   ├── scale-.r
    #>  │       │   ├── scale-alpha.r
    #>  │       │   ├── scale-binned.R
    #>  │       │   ├── scale-brewer.r
    #>  │       │   ├── scale-colour.r
    #>  │       │   ├── scale-continuous.r
    #>  │       │   ├── scale-date.r
    #>  │       │   ├── scale-discrete-.r
    #>  │       │   ├── scale-expansion.r
    #>  │       │   ├── scale-gradient.r
    #>  │       │   ├── scale-grey.r
    #>  │       │   ├── scale-hue.r
    #>  │       │   ├── scale-identity.r
    #>  │       │   ├── scale-linetype.r
    #>  │       │   ├── scale-manual.r
    #>  │       │   ├── scale-shape.r
    #>  │       │   ├── scale-size.r
    #>  │       │   ├── scale-steps.R
    #>  │       │   ├── scale-type.R
    #>  │       │   ├── scale-view.r
    #>  │       │   ├── scale-viridis.r
    #>  │       │   ├── scales-.r
    #>  │       │   ├── stat-.r
    #>  │       │   ├── stat-bin.r
    #>  │       │   ├── stat-bin2d.r
    #>  │       │   ├── stat-bindot.r
    #>  │       │   ├── stat-binhex.r
    #>  │       │   ├── stat-boxplot.r
    #>  │       │   ├── stat-contour.r
    #>  │       │   ├── stat-count.r
    #>  │       │   ├── stat-density-2d.r
    #>  │       │   ├── stat-density.r
    #>  │       │   ├── stat-ecdf.r
    #>  │       │   ├── stat-ellipse.R
    #>  │       │   ├── stat-function.r
    #>  │       │   ├── stat-identity.r
    #>  │       │   ├── stat-qq-line.R
    #>  │       │   ├── stat-qq.r
    #>  │       │   ├── stat-quantile.r
    #>  │       │   ├── stat-sf-coordinates.R
    #>  │       │   ├── stat-sf.R
    #>  │       │   ├── stat-smooth-methods.r
    #>  │       │   ├── stat-smooth.r
    #>  │       │   ├── stat-sum.r
    #>  │       │   ├── stat-summary-2d.r
    #>  │       │   ├── stat-summary-bin.R
    #>  │       │   ├── stat-summary-hex.r
    #>  │       │   ├── stat-summary.r
    #>  │       │   ├── stat-unique.r
    #>  │       │   ├── stat-ydensity.r
    #>  │       │   ├── summarise-plot.R
    #>  │       │   ├── summary.r
    #>  │       │   ├── theme-current.R
    #>  │       │   ├── theme-defaults.r
    #>  │       │   ├── theme-elements.r
    #>  │       │   ├── theme.r
    #>  │       │   ├── translate-qplot-ggplot.r
    #>  │       │   ├── translate-qplot-lattice.r
    #>  │       │   ├── utilities-break.r
    #>  │       │   ├── utilities-grid.r
    #>  │       │   ├── utilities-help.r
    #>  │       │   ├── utilities-matrix.r
    #>  │       │   ├── utilities-resolution.r
    #>  │       │   ├── utilities-table.r
    #>  │       │   ├── utilities-tidy-eval.R
    #>  │       │   ├── utilities.r
    #>  │       │   ├── zxx.r
    #>  │       │   └── zzz.r
    #>  │       ├── README.Rmd
    #>  │       ├── README.md
    #>  │       ├── _pkgdown.yml
    #>  │       ├── appveyor.yml
    #>  │       ├── codecov.yml
    #>  │       ├── cran-comments.md
    #>  │       ├── data
    #>  │       │   ├── diamonds.rda
    #>  │       │   ├── economics.rda
    #>  │       │   ├── economics_long.rda
    #>  │       │   ├── faithfuld.rda
    #>  │       │   ├── luv_colours.rda
    #>  │       │   ├── midwest.rda
    #>  │       │   ├── mpg.rda
    #>  │       │   ├── msleep.rda
    #>  │       │   ├── presidential.rda
    #>  │       │   ├── seals.rda
    #>  │       │   └── txhousing.rda
    #>  │       ├── data-raw
    #>  │       │   ├── diamonds.R
    #>  │       │   ├── diamonds.csv
    #>  │       │   ├── economics.R
    #>  │       │   ├── economics.csv
    #>  │       │   ├── economics_raw
    #>  │       │   │   ├── PCE.csv
    #>  │       │   │   ├── POP.csv
    #>  │       │   │   ├── PSAVERT.csv
    #>  │       │   │   ├── UEMPMED.csv
    #>  │       │   │   └── UNEMPLOY.csv
    #>  │       │   ├── faithfuld.R
    #>  │       │   ├── luv_colours.R
    #>  │       │   ├── midwest.R
    #>  │       │   ├── midwest.csv
    #>  │       │   ├── mpg.R
    #>  │       │   ├── mpg.csv
    #>  │       │   ├── msleep.R
    #>  │       │   ├── msleep.csv
    #>  │       │   ├── presidential.R
    #>  │       │   ├── presidential.csv
    #>  │       │   ├── seals.R
    #>  │       │   ├── seals.csv
    #>  │       │   ├── tx-housing.R
    #>  │       │   └── tx-housing.csv
    #>  │       ├── ggplot2.Rproj
    #>  │       ├── icons
    #>  │       │   ├── coord_cartesian.png
    #>  │       │   ├── coord_fixed.png
    #>  │       │   ├── coord_flip.png
    #>  │       │   ├── coord_map.png
    #>  │       │   ├── coord_polar.png
    #>  │       │   ├── coord_transform.png
    #>  │       │   ├── facet_grid.png
    #>  │       │   ├── facet_wrap.png
    #>  │       │   ├── geom_abline.png
    #>  │       │   ├── geom_area.png
    #>  │       │   ├── geom_bar.png
    #>  │       │   ├── geom_bin2d.png
    #>  │       │   ├── geom_blank.png
    #>  │       │   ├── geom_boxplot.png
    #>  │       │   ├── geom_contour.png
    #>  │       │   ├── geom_count.png
    #>  │       │   ├── geom_crossbar.png
    #>  │       │   ├── geom_density.png
    #>  │       │   ├── geom_dotplot.png
    #>  │       │   ├── geom_freqpoly.png
    #>  │       │   ├── geom_hex.png
    #>  │       │   ├── geom_histogram.png
    #>  │       │   ├── geom_jitter.png
    #>  │       │   ├── geom_line.png
    #>  │       │   ├── geom_map.png
    #>  │       │   ├── geom_path.png
    #>  │       │   ├── geom_point.png
    #>  │       │   ├── geom_pointrange.png
    #>  │       │   ├── geom_polygon.png
    #>  │       │   ├── geom_quantile.png
    #>  │       │   ├── geom_raster.png
    #>  │       │   ├── geom_rect.png
    #>  │       │   ├── geom_ribbon.png
    #>  │       │   ├── geom_rug.png
    #>  │       │   ├── geom_segment.png
    #>  │       │   ├── geom_sf.png
    #>  │       │   ├── geom_smooth.png
    #>  │       │   ├── geom_spoke.png
    #>  │       │   ├── geom_step.png
    #>  │       │   ├── geom_text.png
    #>  │       │   ├── geom_tile.png
    #>  │       │   ├── geom_violin.png
    #>  │       │   ├── icons.R
    #>  │       │   ├── position_dodge.png
    #>  │       │   ├── position_fill.png
    #>  │       │   ├── position_identity.png
    #>  │       │   ├── position_jitter.png
    #>  │       │   ├── position_stack.png
    #>  │       │   ├── scale_alpha.png
    #>  │       │   ├── scale_colour_brewer.png
    #>  │       │   ├── scale_colour_continuous.png
    #>  │       │   ├── scale_colour_gradient.png
    #>  │       │   ├── scale_colour_grey.png
    #>  │       │   ├── scale_colour_hue.png
    #>  │       │   ├── scale_colour_manual.png
    #>  │       │   ├── scale_colour_viridis.png
    #>  │       │   ├── scale_colour_viridis_d.png
    #>  │       │   ├── scale_linetype.png
    #>  │       │   ├── scale_shape.png
    #>  │       │   ├── scale_size.png
    #>  │       │   └── scale_x_date.png
    #>  │       ├── inst
    #>  │       │   └── CITATION
    #>  │       ├── man
    #>  │       │   ├── absoluteGrob.Rd
    #>  │       │   ├── add_theme.Rd
    #>  │       │   ├── aes.Rd
    #>  │       │   ├── aes_.Rd
    #>  │       │   ├── aes_all.Rd
    #>  │       │   ├── aes_auto.Rd
    #>  │       │   ├── aes_colour_fill_alpha.Rd
    #>  │       │   ├── aes_eval.Rd
    #>  │       │   ├── aes_group_order.Rd
    #>  │       │   ├── aes_linetype_size_shape.Rd
    #>  │       │   ├── aes_position.Rd
    #>  │       │   ├── annotate.Rd
    #>  │       │   ├── annotation_custom.Rd
    #>  │       │   ├── annotation_logticks.Rd
    #>  │       │   ├── annotation_map.Rd
    #>  │       │   ├── annotation_raster.Rd
    #>  │       │   ├── as.list.ggproto.Rd
    #>  │       │   ├── as_labeller.Rd
    #>  │       │   ├── autolayer.Rd
    #>  │       │   ├── autoplot.Rd
    #>  │       │   ├── benchplot.Rd
    #>  │       │   ├── bidirection.Rd
    #>  │       │   ├── binned_scale.Rd
    #>  │       │   ├── borders.Rd
    #>  │       │   ├── calc_element.Rd
    #>  │       │   ├── combine_vars.Rd
    #>  │       │   ├── continuous_scale.Rd
    #>  │       │   ├── coord_cartesian.Rd
    #>  │       │   ├── coord_fixed.Rd
    #>  │       │   ├── coord_flip.Rd
    #>  │       │   ├── coord_map.Rd
    #>  │       │   ├── coord_munch.Rd
    #>  │       │   ├── coord_polar.Rd
    #>  │       │   ├── coord_trans.Rd
    #>  │       │   ├── cut_interval.Rd
    #>  │       │   ├── diamonds.Rd
    #>  │       │   ├── discrete_scale.Rd
    #>  │       │   ├── draw_key.Rd
    #>  │       │   ├── economics.Rd
    #>  │       │   ├── element.Rd
    #>  │       │   ├── element_grob.Rd
    #>  │       │   ├── element_render.Rd
    #>  │       │   ├── expand_limits.Rd
    #>  │       │   ├── expansion.Rd
    #>  │       │   ├── facet_grid.Rd
    #>  │       │   ├── facet_null.Rd
    #>  │       │   ├── facet_wrap.Rd
    #>  │       │   ├── faithfuld.Rd
    #>  │       │   ├── figures
    #>  │       │   │   ├── README-example-1.png
    #>  │       │   │   └── logo.png
    #>  │       │   ├── find_panel.Rd
    #>  │       │   ├── fortify-multcomp.Rd
    #>  │       │   ├── fortify.Rd
    #>  │       │   ├── fortify.lm.Rd
    #>  │       │   ├── fortify.map.Rd
    #>  │       │   ├── fortify.sp.Rd
    #>  │       │   ├── geom_abline.Rd
    #>  │       │   ├── geom_bar.Rd
    #>  │       │   ├── geom_bin2d.Rd
    #>  │       │   ├── geom_blank.Rd
    #>  │       │   ├── geom_boxplot.Rd
    #>  │       │   ├── geom_contour.Rd
    #>  │       │   ├── geom_count.Rd
    #>  │       │   ├── geom_density.Rd
    #>  │       │   ├── geom_density_2d.Rd
    #>  │       │   ├── geom_dotplot.Rd
    #>  │       │   ├── geom_errorbarh.Rd
    #>  │       │   ├── geom_hex.Rd
    #>  │       │   ├── geom_histogram.Rd
    #>  │       │   ├── geom_jitter.Rd
    #>  │       │   ├── geom_linerange.Rd
    #>  │       │   ├── geom_map.Rd
    #>  │       │   ├── geom_path.Rd
    #>  │       │   ├── geom_point.Rd
    #>  │       │   ├── geom_polygon.Rd
    #>  │       │   ├── geom_qq.Rd
    #>  │       │   ├── geom_quantile.Rd
    #>  │       │   ├── geom_ribbon.Rd
    #>  │       │   ├── geom_rug.Rd
    #>  │       │   ├── geom_segment.Rd
    #>  │       │   ├── geom_smooth.Rd
    #>  │       │   ├── geom_spoke.Rd
    #>  │       │   ├── geom_text.Rd
    #>  │       │   ├── geom_tile.Rd
    #>  │       │   ├── geom_violin.Rd
    #>  │       │   ├── gg-add.Rd
    #>  │       │   ├── gg_dep.Rd
    #>  │       │   ├── ggplot.Rd
    #>  │       │   ├── ggplot2-ggproto.Rd
    #>  │       │   ├── ggplot2-package.Rd
    #>  │       │   ├── ggplotGrob.Rd
    #>  │       │   ├── ggplot_add.Rd
    #>  │       │   ├── ggplot_build.Rd
    #>  │       │   ├── ggplot_gtable.Rd
    #>  │       │   ├── ggproto.Rd
    #>  │       │   ├── ggsave.Rd
    #>  │       │   ├── ggsf.Rd
    #>  │       │   ├── ggtheme.Rd
    #>  │       │   ├── graphical-units.Rd
    #>  │       │   ├── guide-exts.Rd
    #>  │       │   ├── guide_axis.Rd
    #>  │       │   ├── guide_bins.Rd
    #>  │       │   ├── guide_colourbar.Rd
    #>  │       │   ├── guide_coloursteps.Rd
    #>  │       │   ├── guide_legend.Rd
    #>  │       │   ├── guide_none.Rd
    #>  │       │   ├── guides.Rd
    #>  │       │   ├── hmisc.Rd
    #>  │       │   ├── is.Coord.Rd
    #>  │       │   ├── is.facet.Rd
    #>  │       │   ├── is.ggplot.Rd
    #>  │       │   ├── is.rel.Rd
    #>  │       │   ├── is.theme.Rd
    #>  │       │   ├── label_bquote.Rd
    #>  │       │   ├── labeller.Rd
    #>  │       │   ├── labellers.Rd
    #>  │       │   ├── labs.Rd
    #>  │       │   ├── last_plot.Rd
    #>  │       │   ├── layer.Rd
    #>  │       │   ├── layer_sf.Rd
    #>  │       │   ├── limits.Rd
    #>  │       │   ├── lims.Rd
    #>  │       │   ├── luv_colours.Rd
    #>  │       │   ├── map_data.Rd
    #>  │       │   ├── max_height.Rd
    #>  │       │   ├── mean_se.Rd
    #>  │       │   ├── merge_element.Rd
    #>  │       │   ├── midwest.Rd
    #>  │       │   ├── mpg.Rd
    #>  │       │   ├── msleep.Rd
    #>  │       │   ├── position_dodge.Rd
    #>  │       │   ├── position_identity.Rd
    #>  │       │   ├── position_jitter.Rd
    #>  │       │   ├── position_jitterdodge.Rd
    #>  │       │   ├── position_nudge.Rd
    #>  │       │   ├── position_stack.Rd
    #>  │       │   ├── presidential.Rd
    #>  │       │   ├── print.ggplot.Rd
    #>  │       │   ├── print.ggproto.Rd
    #>  │       │   ├── qplot.Rd
    #>  │       │   ├── reexports.Rd
    #>  │       │   ├── register_theme_elements.Rd
    #>  │       │   ├── remove_missing.Rd
    #>  │       │   ├── render_axes.Rd
    #>  │       │   ├── render_strips.Rd
    #>  │       │   ├── resolution.Rd
    #>  │       │   ├── scale_alpha.Rd
    #>  │       │   ├── scale_binned.Rd
    #>  │       │   ├── scale_brewer.Rd
    #>  │       │   ├── scale_colour_continuous.Rd
    #>  │       │   ├── scale_continuous.Rd
    #>  │       │   ├── scale_date.Rd
    #>  │       │   ├── scale_discrete.Rd
    #>  │       │   ├── scale_gradient.Rd
    #>  │       │   ├── scale_grey.Rd
    #>  │       │   ├── scale_hue.Rd
    #>  │       │   ├── scale_identity.Rd
    #>  │       │   ├── scale_linetype.Rd
    #>  │       │   ├── scale_manual.Rd
    #>  │       │   ├── scale_shape.Rd
    #>  │       │   ├── scale_size.Rd
    #>  │       │   ├── scale_steps.Rd
    #>  │       │   ├── scale_type.Rd
    #>  │       │   ├── scale_viridis.Rd
    #>  │       │   ├── seals.Rd
    #>  │       │   ├── sec_axis.Rd
    #>  │       │   ├── set_last_plot.Rd
    #>  │       │   ├── should_stop.Rd
    #>  │       │   ├── standardise_aes_names.Rd
    #>  │       │   ├── stat_ecdf.Rd
    #>  │       │   ├── stat_ellipse.Rd
    #>  │       │   ├── stat_function.Rd
    #>  │       │   ├── stat_identity.Rd
    #>  │       │   ├── stat_sf_coordinates.Rd
    #>  │       │   ├── stat_summary.Rd
    #>  │       │   ├── stat_summary_2d.Rd
    #>  │       │   ├── stat_unique.Rd
    #>  │       │   ├── summarise_plot.Rd
    #>  │       │   ├── summary.ggplot.Rd
    #>  │       │   ├── theme.Rd
    #>  │       │   ├── theme_get.Rd
    #>  │       │   ├── tidyeval.Rd
    #>  │       │   ├── transform_position.Rd
    #>  │       │   ├── translate_qplot_ggplot.Rd
    #>  │       │   ├── translate_qplot_lattice.Rd
    #>  │       │   ├── txhousing.Rd
    #>  │       │   ├── update_defaults.Rd
    #>  │       │   ├── update_labels.Rd
    #>  │       │   ├── vars.Rd
    #>  │       │   ├── waiver.Rd
    #>  │       │   ├── wrap_dims.Rd
    #>  │       │   └── zeroGrob.Rd
    #>  │       ├── pkgdown
    #>  │       │   └── favicon
    #>  │       │       ├── apple-touch-icon-120x120.png
    #>  │       │       ├── apple-touch-icon-152x152.png
    #>  │       │       ├── apple-touch-icon-180x180.png
    #>  │       │       ├── apple-touch-icon-60x60.png
    #>  │       │       ├── apple-touch-icon-76x76.png
    #>  │       │       ├── apple-touch-icon.png
    #>  │       │       ├── favicon-16x16.png
    #>  │       │       ├── favicon-32x32.png
    #>  │       │       └── favicon.ico
    #>  │       ├── revdep
    #>  │       │   ├── README.md
    #>  │       │   ├── cran.md
    #>  │       │   ├── email.yml
    #>  │       │   ├── failures.md
    #>  │       │   └── problems.md
    #>  │       ├── tests
    #>  │       │   ├── figs
    #>  │       │   │   ├── annotate
    #>  │       │   │   │   └── line-matches-points.svg
    #>  │       │   │   ├── coord-cartesian
    #>  │       │   │   │   ├── clip-on-by-default-only-inside-visible.svg
    #>  │       │   │   │   ├── clip-turned-off-both-inside-and-outside-visible.svg
    #>  │       │   │   │   ├── contract-range.svg
    #>  │       │   │   │   └── expand-range.svg
    #>  │       │   │   ├── coord-map
    #>  │       │   │   │   ├── coord-map-switched-scale-position.svg
    #>  │       │   │   │   └── usa-mercator.svg
    #>  │       │   │   ├── coord-polar
    #>  │       │   │   │   ├── racetrack-plot-closed-and-has-center-hole.svg
    #>  │       │   │   │   ├── racetrack-plot-closed-and-no-center-hole.svg
    #>  │       │   │   │   ├── rays-circular-arcs-and-spiral-arcs.svg
    #>  │       │   │   │   ├── rose-plot-with-has-equal-spacing.svg
    #>  │       │   │   │   ├── secondary-axis-ticks-and-labels.svg
    #>  │       │   │   │   └── three-concentric-circles.svg
    #>  │       │   │   ├── coord-sf
    #>  │       │   │   │   ├── no-panel-grid.svg
    #>  │       │   │   │   └── sf-polygons.svg
    #>  │       │   │   ├── coord-trans
    #>  │       │   │   │   ├── basic-coord-trans-plot.svg
    #>  │       │   │   │   └── sec-axis-with-coord-trans.svg
    #>  │       │   │   ├── creating-aesthetic-mappings
    #>  │       │   │   │   ├── alpha-set-in-alpha.svg
    #>  │       │   │   │   ├── alpha-set-in-colour.svg
    #>  │       │   │   │   ├── stat-count-width-0-5.svg
    #>  │       │   │   │   ├── stat-count.svg
    #>  │       │   │   │   ├── stat-identity-width-0-5.svg
    #>  │       │   │   │   └── stat-identity.svg
    #>  │       │   │   ├── deps.txt
    #>  │       │   │   ├── facet-labels
    #>  │       │   │   │   └── parsed-facet-labels.svg
    #>  │       │   │   ├── facet-strips
    #>  │       │   │   │   └── switched-facet-strips.svg
    #>  │       │   │   ├── facetting
    #>  │       │   │   │   ├── left-justified-facet-labels-with-margins.svg
    #>  │       │   │   │   └── left-justified-rotated-facet-labels-with-margins.svg
    #>  │       │   │   ├── geom-boxplot
    #>  │       │   │   │   └── outlier-colours.svg
    #>  │       │   │   ├── geom-dotplot
    #>  │       │   │   │   ├── 2-na-values-bin-along-y-stack-center.svg
    #>  │       │   │   │   ├── 2-na-values-dot-density-binning-binwidth-4.svg
    #>  │       │   │   │   ├── basic-dotplot-with-dot-density-binning-binwidth-4.svg
    #>  │       │   │   │   ├── bin-along-y-stack-center.svg
    #>  │       │   │   │   ├── bin-along-y-stack-centerwhole-histodot.svg
    #>  │       │   │   │   ├── bin-along-y-stack-centerwhole.svg
    #>  │       │   │   │   ├── bin-y-continous-x-axis-grouping-by-x.svg
    #>  │       │   │   │   ├── bin-y-continous-x-axis-single-x-group.svg
    #>  │       │   │   │   ├── bin-y-dodged-coord-flip.svg
    #>  │       │   │   │   ├── bin-y-dodged.svg
    #>  │       │   │   │   ├── bin-y-dodging-3-stackgroups-histodot-currently-broken.svg
    #>  │       │   │   │   ├── bin-y-three-x-groups-bins-aligned-across-groups.svg
    #>  │       │   │   │   ├── bin-y-three-x-groups-bins-aligned-coord-flip.svg
    #>  │       │   │   │   ├── bin-y-three-x-groups-fill-and-dodge.svg
    #>  │       │   │   │   ├── bin-y-three-x-groups-stack-centerwhole.svg
    #>  │       │   │   │   ├── dots-stacked-closer-stackratio-5-fill-white.svg
    #>  │       │   │   │   ├── facets-3-groups-histodot-stackgroups.svg
    #>  │       │   │   │   ├── histodot-binning-equal-bin-spacing.svg
    #>  │       │   │   │   ├── larger-dots-dotsize-1-5-fill-white.svg
    #>  │       │   │   │   ├── multiple-groups-bins-aligned.svg
    #>  │       │   │   │   ├── multiple-groups-bins-not-aligned.svg
    #>  │       │   │   │   ├── stack-center-with-coord-flip.svg
    #>  │       │   │   │   ├── stack-center.svg
    #>  │       │   │   │   ├── stack-centerwhole-with-coord-flip.svg
    #>  │       │   │   │   ├── stack-centerwhole.svg
    #>  │       │   │   │   ├── stack-down-with-coord-flip.svg
    #>  │       │   │   │   ├── stack-down.svg
    #>  │       │   │   │   ├── stack-up-with-coord-flip.svg
    #>  │       │   │   │   ├── stack-up.svg
    #>  │       │   │   │   ├── stackgroups-with-3-groups-bin-y-histodot.svg
    #>  │       │   │   │   ├── stackgroups-with-3-groups-dot-density-with-aligned-bins.svg
    #>  │       │   │   │   ├── stackgroups-with-3-groups-histodot.svg
    #>  │       │   │   │   └── variable-linetype-and-size-work-when-specified-as-aesthetics.svg
    #>  │       │   │   ├── geom-hline-vline-abline
    #>  │       │   │   │   ├── cartesian-lines-intersect-mid-bars.svg
    #>  │       │   │   │   ├── flipped-lines-intersect-mid-bars.svg
    #>  │       │   │   │   ├── lines-curved-in-azequalarea.svg
    #>  │       │   │   │   ├── polar-lines-intersect-mid-bars.svg
    #>  │       │   │   │   └── straight-lines-in-mercator.svg
    #>  │       │   │   ├── geom-path
    #>  │       │   │   │   ├── lines-colour-with-changed-data-order-should-have-same-appearance.svg
    #>  │       │   │   │   ├── lines-colour.svg
    #>  │       │   │   │   ├── lines-with-changed-data-order-should-have-same-appearance.svg
    #>  │       │   │   │   ├── lines.svg
    #>  │       │   │   │   └── na-linetype.svg
    #>  │       │   │   ├── geom-polygon
    #>  │       │   │   │   └── basic-polygon-plot.svg
    #>  │       │   │   ├── geom-raster
    #>  │       │   │   │   ├── 1-x-3-just-0-0.svg
    #>  │       │   │   │   ├── 1-x-3-set-limits.svg
    #>  │       │   │   │   ├── 1-x-3.svg
    #>  │       │   │   │   ├── 3-x-1-just-0-0.svg
    #>  │       │   │   │   ├── 3-x-1-set-limits.svg
    #>  │       │   │   │   ├── 3-x-1.svg
    #>  │       │   │   │   ├── 3-x-2-just-0-0.svg
    #>  │       │   │   │   ├── 3-x-2-set-limits.svg
    #>  │       │   │   │   ├── 3-x-2.svg
    #>  │       │   │   │   └── irregular-categorical.svg
    #>  │       │   │   ├── geom-sf
    #>  │       │   │   │   ├── labels-for-north-carolina.svg
    #>  │       │   │   │   ├── north-carolina-county-boundaries.svg
    #>  │       │   │   │   ├── spatial-points.svg
    #>  │       │   │   │   └── texts-for-north-carolina.svg
    #>  │       │   │   ├── geom-smooth
    #>  │       │   │   │   ├── ribbon-turned-off-in-geom-smooth.svg
    #>  │       │   │   │   └── ribbon-turned-on-in-geom-smooth.svg
    #>  │       │   │   ├── geom-violin
    #>  │       │   │   │   ├── basic.svg
    #>  │       │   │   │   ├── continuous-x-axis-multiple-groups-center-should-be-at-2-0.svg
    #>  │       │   │   │   ├── continuous-x-axis-single-group-center-should-be-at-1-0.svg
    #>  │       │   │   │   ├── coord-flip.svg
    #>  │       │   │   │   ├── coord-polar.svg
    #>  │       │   │   │   ├── dodging-and-coord-flip.svg
    #>  │       │   │   │   ├── dodging.svg
    #>  │       │   │   │   ├── grouping-on-x-and-fill-dodge-width-0-5.svg
    #>  │       │   │   │   ├── grouping-on-x-and-fill.svg
    #>  │       │   │   │   ├── narrower-width-5.svg
    #>  │       │   │   │   ├── quantiles.svg
    #>  │       │   │   │   ├── scale-area-to-sample-size-c-is-smaller.svg
    #>  │       │   │   │   ├── with-smaller-bandwidth-and-points.svg
    #>  │       │   │   │   └── with-tails-and-points.svg
    #>  │       │   │   ├── guides
    #>  │       │   │   │   ├── align-facet-labels-facets-horizontal.svg
    #>  │       │   │   │   ├── align-facet-labels-facets-vertical.svg
    #>  │       │   │   │   ├── axis-guides-basic.svg
    #>  │       │   │   │   ├── axis-guides-check-overlap.svg
    #>  │       │   │   │   ├── axis-guides-negative-rotation.svg
    #>  │       │   │   │   ├── axis-guides-positive-rotation.svg
    #>  │       │   │   │   ├── axis-guides-text-dodged-into-rows-cols.svg
    #>  │       │   │   │   ├── axis-guides-vertical-negative-rotation.svg
    #>  │       │   │   │   ├── axis-guides-vertical-rotation.svg
    #>  │       │   │   │   ├── axis-guides-zero-breaks.svg
    #>  │       │   │   │   ├── axis-guides-zero-rotation.svg
    #>  │       │   │   │   ├── facet-grid-legend-on-bottom.svg
    #>  │       │   │   │   ├── facet-grid-legend-on-left.svg
    #>  │       │   │   │   ├── facet-grid-legend-on-right.svg
    #>  │       │   │   │   ├── facet-grid-legend-on-top.svg
    #>  │       │   │   │   ├── facet-wrap-legend-on-bottom.svg
    #>  │       │   │   │   ├── facet-wrap-legend-on-left.svg
    #>  │       │   │   │   ├── facet-wrap-legend-on-right.svg
    #>  │       │   │   │   ├── facet-wrap-legend-on-top.svg
    #>  │       │   │   │   ├── guide-axis-customization.svg
    #>  │       │   │   │   ├── guide-bins-can-remove-axis.svg
    #>  │       │   │   │   ├── guide-bins-can-show-arrows.svg
    #>  │       │   │   │   ├── guide-bins-can-show-limits.svg
    #>  │       │   │   │   ├── guide-bins-can-show-ticks.svg
    #>  │       │   │   │   ├── guide-bins-looks-as-it-should.svg
    #>  │       │   │   │   ├── guide-bins-work-horizontally.svg
    #>  │       │   │   │   ├── guide-coloursteps-can-have-bins-relative-to-binsize.svg
    #>  │       │   │   │   ├── guide-coloursteps-can-show-limits.svg
    #>  │       │   │   │   ├── guide-coloursteps-looks-as-it-should.svg
    #>  │       │   │   │   ├── guide-title-and-text-positioning-and-alignment-via-themes.svg
    #>  │       │   │   │   ├── guides-specified-in-guides.svg
    #>  │       │   │   │   ├── horizontal-gap-of-1cm-between-guide-and-guide-text.svg
    #>  │       │   │   │   ├── legend-inside-plot-bottom-left-of-legend-at-center.svg
    #>  │       │   │   │   ├── legend-inside-plot-bottom-left.svg
    #>  │       │   │   │   ├── legend-inside-plot-centered.svg
    #>  │       │   │   │   ├── legend-inside-plot-top-right.svg
    #>  │       │   │   │   ├── legend-on-bottom.svg
    #>  │       │   │   │   ├── legend-on-left.svg
    #>  │       │   │   │   ├── legend-on-right.svg
    #>  │       │   │   │   ├── legend-on-top.svg
    #>  │       │   │   │   ├── multi-line-guide-title-works.svg
    #>  │       │   │   │   ├── one-combined-colorbar-for-colour-and-fill-aesthetics.svg
    #>  │       │   │   │   ├── padding-in-legend-box.svg
    #>  │       │   │   │   ├── position-guide-titles.svg
    #>  │       │   │   │   ├── rotated-guide-titles-and-labels.svg
    #>  │       │   │   │   ├── thick-axis-lines.svg
    #>  │       │   │   │   ├── vertical-gap-of-1cm-between-guide-title-and-guide.svg
    #>  │       │   │   │   ├── white-to-red-gradient-colorbar-thick-black-tick-marks-green-frame.svg
    #>  │       │   │   │   └── white-to-red-gradient-colorbar-white-tick-marks-no-frame.svg
    #>  │       │   │   ├── labels
    #>  │       │   │   │   ├── defaults.svg
    #>  │       │   │   │   ├── manual.svg
    #>  │       │   │   │   └── other-position.svg
    #>  │       │   │   ├── legend-key-glyphs
    #>  │       │   │   │   ├── rectangle-and-dotplot-key-glyphs.svg
    #>  │       │   │   │   └── time-series-and-polygon-key-glyphs.svg
    #>  │       │   │   ├── position-stack
    #>  │       │   │   │   └── area-stacking.svg
    #>  │       │   │   ├── scale-date
    #>  │       │   │   │   ├── dates-along-x-default-breaks.svg
    #>  │       │   │   │   ├── dates-along-y-default-breaks.svg
    #>  │       │   │   │   ├── scale-x-date-breaks-3-weeks.svg
    #>  │       │   │   │   ├── scale-x-date-breaks-date-breaks-2-weeks.svg
    #>  │       │   │   │   ├── scale-x-date-labels-date-format-m-d.svg
    #>  │       │   │   │   ├── scale-x-date-labels-date-format-w-week.svg
    #>  │       │   │   │   ├── scale-y-date-breaks-3-weeks.svg
    #>  │       │   │   │   └── scale-y-date-breaks-date-breaks-2-weeks.svg
    #>  │       │   │   ├── scales-breaks-and-labels
    #>  │       │   │   │   ├── character.svg
    #>  │       │   │   │   ├── date.svg
    #>  │       │   │   │   ├── functional-limits.svg
    #>  │       │   │   │   ├── no-alpha-breaks-no-legend.svg
    #>  │       │   │   │   ├── no-colour-breaks-no-legend.svg
    #>  │       │   │   │   ├── no-fill-breaks-no-legend.svg
    #>  │       │   │   │   ├── no-size-breaks-no-legend.svg
    #>  │       │   │   │   ├── no-x-breaks.svg
    #>  │       │   │   │   ├── no-y-breaks.svg
    #>  │       │   │   │   ├── numeric-exp.svg
    #>  │       │   │   │   ├── numeric-log.svg
    #>  │       │   │   │   ├── numeric-polar.svg
    #>  │       │   │   │   └── numeric.svg
    #>  │       │   │   ├── sec-axis
    #>  │       │   │   │   ├── sec-axis-custom-transform.svg
    #>  │       │   │   │   ├── sec-axis-datetime-scale.svg
    #>  │       │   │   │   ├── sec-axis-independent-transformations.svg
    #>  │       │   │   │   ├── sec-axis-monotonicity-test.svg
    #>  │       │   │   │   ├── sec-axis-sec-power-transform.svg
    #>  │       │   │   │   ├── sec-axis-skewed-transform.svg
    #>  │       │   │   │   └── sec-axis-with-division.svg
    #>  │       │   │   ├── stat-sum
    #>  │       │   │   │   ├── summary-with-color-and-lines.svg
    #>  │       │   │   │   ├── summary-with-crossbars-manual-grouping.svg
    #>  │       │   │   │   └── summary-with-crossbars-no-grouping.svg
    #>  │       │   │   └── themes
    #>  │       │   │       ├── axes-styling.svg
    #>  │       │   │       ├── caption-aligned-to-entire-plot.svg
    #>  │       │   │       ├── custom-strip-elements-can-render.svg
    #>  │       │   │       ├── height-is-3-times-width-2-column-facets.svg
    #>  │       │   │       ├── height-is-3-times-width-2-row-facets.svg
    #>  │       │   │       ├── height-is-3-times-width-2-wrap-facets.svg
    #>  │       │   │       ├── height-is-3-times-width-2x2-facets.svg
    #>  │       │   │       ├── height-is-3-times-width.svg
    #>  │       │   │       ├── rotated-x-axis-tick-labels.svg
    #>  │       │   │       ├── strip-styling.svg
    #>  │       │   │       ├── theme-bw-large.svg
    #>  │       │   │       ├── theme-bw.svg
    #>  │       │   │       ├── theme-classic-large.svg
    #>  │       │   │       ├── theme-classic.svg
    #>  │       │   │       ├── theme-dark-large.svg
    #>  │       │   │       ├── theme-dark.svg
    #>  │       │   │       ├── theme-gray-large.svg
    #>  │       │   │       ├── theme-gray.svg
    #>  │       │   │       ├── theme-light-large.svg
    #>  │       │   │       ├── theme-light.svg
    #>  │       │   │       ├── theme-linedraw-large.svg
    #>  │       │   │       ├── theme-linedraw.svg
    #>  │       │   │       ├── theme-minimal-large.svg
    #>  │       │   │       ├── theme-minimal.svg
    #>  │       │   │       ├── theme-void-large.svg
    #>  │       │   │       ├── theme-void.svg
    #>  │       │   │       ├── ticks-length.svg
    #>  │       │   │       ├── title-aligned-to-entire-plot.svg
    #>  │       │   │       ├── titles-aligned-to-entire-plot.svg
    #>  │       │   │       └── width-is-3-times-height.svg
    #>  │       │   ├── testthat
    #>  │       │   │   ├── helper-facet.r
    #>  │       │   │   ├── helper-plot-data.r
    #>  │       │   │   ├── helper-vdiffr.R
    #>  │       │   │   ├── test-add.R
    #>  │       │   │   ├── test-aes-calculated.r
    #>  │       │   │   ├── test-aes-grouping.r
    #>  │       │   │   ├── test-aes-setting.r
    #>  │       │   │   ├── test-aes.r
    #>  │       │   │   ├── test-annotate.r
    #>  │       │   │   ├── test-build.r
    #>  │       │   │   ├── test-conditions.R
    #>  │       │   │   ├── test-coord-.r
    #>  │       │   │   ├── test-coord-cartesian.R
    #>  │       │   │   ├── test-coord-map.R
    #>  │       │   │   ├── test-coord-polar.r
    #>  │       │   │   ├── test-coord-train.r
    #>  │       │   │   ├── test-coord-transform.R
    #>  │       │   │   ├── test-coord_sf.R
    #>  │       │   │   ├── test-data.r
    #>  │       │   │   ├── test-draw-key.R
    #>  │       │   │   ├── test-empty-data.r
    #>  │       │   │   ├── test-error.R
    #>  │       │   │   ├── test-facet-.r
    #>  │       │   │   ├── test-facet-labels.r
    #>  │       │   │   ├── test-facet-layout.r
    #>  │       │   │   ├── test-facet-map.r
    #>  │       │   │   ├── test-facet-strips.r
    #>  │       │   │   ├── test-fortify.r
    #>  │       │   │   ├── test-function-args.r
    #>  │       │   │   ├── test-geom-bar.R
    #>  │       │   │   ├── test-geom-boxplot.R
    #>  │       │   │   ├── test-geom-col.R
    #>  │       │   │   ├── test-geom-dotplot.R
    #>  │       │   │   ├── test-geom-freqpoly.R
    #>  │       │   │   ├── test-geom-hex.R
    #>  │       │   │   ├── test-geom-hline-vline-abline.R
    #>  │       │   │   ├── test-geom-path.R
    #>  │       │   │   ├── test-geom-point.R
    #>  │       │   │   ├── test-geom-polygon.R
    #>  │       │   │   ├── test-geom-raster.R
    #>  │       │   │   ├── test-geom-ribbon.R
    #>  │       │   │   ├── test-geom-rug.R
    #>  │       │   │   ├── test-geom-rule.R
    #>  │       │   │   ├── test-geom-sf.R
    #>  │       │   │   ├── test-geom-smooth.R
    #>  │       │   │   ├── test-geom-text.R
    #>  │       │   │   ├── test-geom-tile.R
    #>  │       │   │   ├── test-geom-violin.R
    #>  │       │   │   ├── test-ggproto.R
    #>  │       │   │   ├── test-ggsave.R
    #>  │       │   │   ├── test-grid-utils.R
    #>  │       │   │   ├── test-guides.R
    #>  │       │   │   ├── test-labels.r
    #>  │       │   │   ├── test-layer.r
    #>  │       │   │   ├── test-munch.r
    #>  │       │   │   ├── test-performance.R
    #>  │       │   │   ├── test-plot-summary-api.R
    #>  │       │   │   ├── test-position-dodge2.R
    #>  │       │   │   ├── test-position-nudge.R
    #>  │       │   │   ├── test-position-stack.R
    #>  │       │   │   ├── test-position_dodge.R
    #>  │       │   │   ├── test-qplot.r
    #>  │       │   │   ├── test-range.r
    #>  │       │   │   ├── test-sanitise-dim.r
    #>  │       │   │   ├── test-scale-brewer.R
    #>  │       │   │   ├── test-scale-date.R
    #>  │       │   │   ├── test-scale-discrete.R
    #>  │       │   │   ├── test-scale-expansion.r
    #>  │       │   │   ├── test-scale-gradient.R
    #>  │       │   │   ├── test-scale-manual.r
    #>  │       │   │   ├── test-scale-type.R
    #>  │       │   │   ├── test-scale_date.R
    #>  │       │   │   ├── test-scales-breaks-labels.r
    #>  │       │   │   ├── test-scales.r
    #>  │       │   │   ├── test-sec-axis.R
    #>  │       │   │   ├── test-stat-bin.R
    #>  │       │   │   ├── test-stat-bin2d.R
    #>  │       │   │   ├── test-stat-boxplot.R
    #>  │       │   │   ├── test-stat-contour.R
    #>  │       │   │   ├── test-stat-density.R
    #>  │       │   │   ├── test-stat-density2d.R
    #>  │       │   │   ├── test-stat-ellipsis.R
    #>  │       │   │   ├── test-stat-hex.R
    #>  │       │   │   ├── test-stat-sf-coordinates.R
    #>  │       │   │   ├── test-stat-sum.R
    #>  │       │   │   ├── test-stat-summary.R
    #>  │       │   │   ├── test-stats-function.r
    #>  │       │   │   ├── test-stats.r
    #>  │       │   │   ├── test-theme.r
    #>  │       │   │   ├── test-utilities.r
    #>  │       │   │   ├── test-viridis.R
    #>  │       │   │   └── test-zzz.R
    #>  │       │   └── testthat.R
    #>  │       └── vignettes
    #>  │           ├── car.png
    #>  │           ├── extending-ggplot2.Rmd
    #>  │           ├── ggplot2-in-packages.Rmd
    #>  │           ├── ggplot2-specs.Rmd
    #>  │           ├── profiling.Rmd
    #>  │           └── profilings
    #>  │               └── 3.1.0.rds
    #>  ├── figs
    #>  ├── git-logs.Rproj
    #>  ├── helpers.md
    #>  ├── requirements.txt
    #>  └── results
    #>      └── README.md
