code maat - installing and running clojure
================
Martin Frigaard, MA, MAS
2020-01-27

  - [Installing code maat](#installing-code-maat)
      - [Step 1: Print Java version](#step-1-print-java-version)
      - [Step 2: `code maat` jar files](#step-2-code-maat-jar-files)
          - [Quick description of code
            maat](#quick-description-of-code-maat)
      - [Step 3: Install `leinigen` (for
        `uberjar`)](#step-3-install-leinigen-for-uberjar)
      - [Step 4: using `uberjar` with
        leiningen](#step-4-using-uberjar-with-leiningen)
          - [Step 4.1: Create a `project.clj`
            file](#step-4.1-create-a-project.clj-file)
      - [Step 5: Creating a
        `logfile.log`](#step-5-creating-a-logfile.log)
      - [Step 6: Running code maat](#step-6-running-code-maat)
          - [Print `-summary`](#print--summary)
          - [Running code maat in `code-maat` repo (super
            meta)](#running-code-maat-in-code-maat-repo-super-meta)
          - [Print `-a coupling`](#print--a-coupling)

# Installing code maat

code maat tool is free and open source on
[Github](https://github.com/adamtornhill/code-maat). This tool was
developed by Tornhill and is implemented in Clojure.

## Step 1: Print Java version

The version of Java is accessible via `java -version`

``` bash
java -version
```

    #> openjdk version "12" 2019-03-19
    #> OpenJDK Runtime Environment (build 12+33)
    #> OpenJDK 64-Bit Server VM (build 12+33, mixed mode, sharing)

The Java version on this machine is new enough.

## Step 2: `code maat` jar files

We’ve downloaded the jar files from Tornhill’s website, available
[here](http://adamtornhill.com/code/maatdistro.htm). These files are
stored in the `downloads` folder.

``` r
fs::dir_tree("downloads", recurse = FALSE)
```

    #> downloads
    #> └── code-maat-master

### Quick description of code maat

What does code maat do?

> Code Maat operates on the level of log files generated from any of
> several version-control systems (including Subversion, TFS, Git, and
> others), and the GitHub page contains detailed instructions on how to
> generate the input data to the tool.

We’ll go through the installation instructions on page 216 of the SDXR
text.

> Once you have a log file you feed it to Code Maat, which parses the
> log file and then performs any of the `file-` or `architectural-`
> level analyses discussed in this book. You specify the type of
> analysis via a command-line argument. Here’s an example of a change
> coupling analysis, specified through the `-a` coupling argument, and
> using one of the supported Git formats where the version-control log
> is stored in the file `vcs_log.txt`:

``` bash
$ java -jar code-maat-standalone.jar -c git2 -l maat.log -a coupling

entity,coupled,degree,average-revs
analysis/effort.clj,analysis/effort_test.clj,100,5
analysis/churn.clj,analysis/churn_test.clj,89,15
parsers/git.clj,parsers/git_test.clj,80,24
```

> Since pure text is the universal interface it allows you to
> postprocess that data or visualize it as discussed later in this
> appendix.

Where is `vsc_log.txt`? We need a bit more information to get this
setup, so we’ll head over to the Github page.

## Step 3: Install `leinigen` (for `uberjar`)

First we need to install `leinigen` package with homebrew:

``` bash
brew install leiningen
```

    #> Warning: leiningen 2.9.1 is already installed and up-to-date
    #> To reinstall 2.9.1, run `brew reinstall leiningen`

Read more about [homebrew
packaging](https://github.com/technomancy/leiningen/wiki/Packaging).

## Step 4: using `uberjar` with leiningen

We’ll begin by building the .jar code from source using `lein uberjar`
[see source here](https://github.com/adamtornhill/code-maat#usage), but
we need to make sure the clojure project file has been created and saved
in the same directory we are currently working in.

### Step 4.1: Create a `project.clj` file

We need to put the following contents in a file titled, `project.clj`

``` clojure
(defproject myproject "0.5.0-SNAPSHOT"
  :description "A project for doing things."
  :license "Eclipse Public License 1.0"
  :url "http://github.com/technomancy/myproject"
  :dependencies [[org.clojure/clojure "1.8.0"]]
  :plugins [[lein-tar "3.2.0"]])
```

This file is located in the parent directory,

``` r
fs::dir_tree(".", recurse = FALSE)
```

    #> .
    #> ├── README.Rmd
    #> ├── code
    #> ├── code-maat-1.0-standalone.jar
    #> ├── code-maat.Rproj
    #> ├── data
    #> ├── docs
    #> ├── downloads
    #> ├── figs
    #> ├── logfile.log
    #> ├── meta
    #> ├── project.clj
    #> └── target

After installation, we can proceed with the installation of the
`uberjar` package.

``` bash
lein uberjar
```

    #> Created /Users/martinfrigaard/Dropbox/@wrkng-projects/02-unpaid/@aperture-marketing/code-forensics/code-maat/target/myproject-0.5.0-SNAPSHOT.jar
    #> Created /Users/martinfrigaard/Dropbox/@wrkng-projects/02-unpaid/@aperture-marketing/code-forensics/code-maat/target/myproject-0.5.0-SNAPSHOT-standalone.jar

Executing the code file below creates the `target/` directory.

``` r
fs::dir_tree("target")
```

    #> target
    #> ├── classes
    #> │   └── META-INF
    #> │       └── maven
    #> │           └── myproject
    #> │               └── myproject
    #> │                   └── pom.properties
    #> ├── myproject-0.5.0-SNAPSHOT-standalone.jar
    #> ├── myproject-0.5.0-SNAPSHOT.jar
    #> └── stale
    #>     └── leiningen.core.classpath.extract-native-dependencies

## Step 5: Creating a `logfile.log`

In order to store the output data in a file we can access, we’ll need to
create a log file using `touch` and the name of the file, like
`logfile.log`.

``` bash
touch "logfile.log"
# verify
ls
```

    #> README.Rmd
    #> code
    #> code-maat-1.0-standalone.jar
    #> code-maat.Rproj
    #> data
    #> docs
    #> downloads
    #> figs
    #> logfile.log
    #> meta
    #> project.clj
    #> target

We can see the `logfile.log` file in the parent folder.

## Step 6: Running code maat

We can now use the `java -jar` command coupled with
`code-maat-1.0-standalone.jar` to run `code maat` with the `bash`
commands below.

``` bash
java -jar code-maat-1.0-standalone.jar -l logfile.log -c git2
```

    #> entity,n-authors,n-revs

This shows us the `entity,n-authors,n-revs`. But these results are not
in the `logfile.log` file, and we can tell by printing the contents of
`logfile.log` file to the Terminal.

``` bash
cat logfile.log
```

### Print `-summary`

Now that everything seems to be working, we can use the `-c git2 -a
summary` commands to get the commits, entities, entities-changed, and
authors.

``` bash
java -jar code-maat-1.0-standalone.jar -l logfile.log -c git2 -a summary
```

    #> statistic,value
    #> number-of-commits,0
    #> number-of-entities,0
    #> number-of-entities-changed,0
    #> number-of-authors,0

### Running code maat in `code-maat` repo (super meta)

We will run the same code from above in the [`code maat` package
repo](https://github.com/adamtornhill/code-maat) to see if it works on
an outside Git repo.

``` bash
cd downloads/code-maat-master
# check to see where you are!
# pwd

# create logfile.log
touch logfile.log
# verify new file
# ls -la 

## ===== run the git2 java jar script ===== ##

# /-- this is the previous script:
#     java -jar code-maat-standalone.jar -c git2 -l maat.log -a coupling 
# --/ we'll be repeating this but with the new standalone.jar
java -jar code-maat-1.0-standalone.jar -c git2 -l logfile.log
```

    #> entity,n-authors,n-revs

### Print `-a coupling`

``` bash
java -jar code-maat-1.0-standalone.jar -l logfile.log -c git -a coupling
```

    #> entity,coupled,degree,average-revs

> These repos aren’t showing any data–any ideas?
