[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Language grade: Java](https://img.shields.io/lgtm/grade/java/g/mP1/j2cl.svg?logo=lgtm&logoWidth=18)](https://lgtm.com/projects/g/mP1/j2cl/context:java)
[![Total alerts](https://img.shields.io/lgtm/alerts/g/mP1/j2cl.svg?logo=lgtm&logoWidth=18)](https://lgtm.com/projects/g/mP1/j2cl/alerts/)



j2cl project
============

A fork of [vertispan/j2cl](http://github.com/vertispan/j2cl.git) which is itself a fork of [google/j2cl](http://github.com/google/j2cl.git).
Additional modifications have been made in maven poms assigning groupId=walkingkooka and some minor artifactId changes
to a few selected maven sub modules.

For the complete README refer to the google github project.



# Usage

Include this project as a dependency.

```xml
git clone git://github.com/mP1/j2cl.git
```

Install [bazel 2.2.0](https://docs.bazel.build/versions/1.0.0/install.html) then build with bazel

```bash
bazel clean
```

```bash
./build_test.sh
```

```bash
cd maven
```

Build using the provided `build.sh` script.

```bash
./build.sh
```

Package and install with maven, clean will be required the shade plugin will fail.

```bash
mvn clean install
```



# Contributions

Suggestions via the issue tracker, and pull requests are most welcomed.
