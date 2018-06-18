#!/usr/bin/env bash

set -e

# Tweak these based on the path to your j2cl, your preferred groupid
J2CL_REPO=/Users/colin/workspace/j2cl
GROUP_ID=com.vertispan.j2cl

GOAL='install:install-file'
if [[ $1 = "deploy" ]]
then
    GOAL='deploy:deploy-file'
fi

# Bootstrap (assumes primitives exist...)
if [[ ! -e "bootstrap.js.zip" ]]
then
    echo "bootstrap.js.zip doesn't exist, run bootstrap.sh"
    exit -1;
fi
mvn $GOAL -DrepositoryId=vertispan-releases -Durl=https://repo.vertispan.com/j2cl -Dfile=bootstrap.js.zip -DgroupId=$GROUP_ID -DartifactId=bootstrap -Dversion=0.1-SNAPSHOT -Dtype=zip -Dclassifier=jszip -Dpackaging=zip

# Transpiler itself (and eventually other jars
pushd $J2CL_REPO/transpiler
# TODO this doesn't respect the GROUPID above, you'll need to tweak this too
mvn clean install -Ppackage
popd

# JRE
pushd $J2CL_REPO/bazel-bin/jre/java
mvn $GOAL -DrepositoryId=vertispan-releases -Durl=https://repo.vertispan.com/j2cl -Dfile=jre.jar -DgroupId=$GROUP_ID -DartifactId=jre -Dversion=0.1-SNAPSHOT -Dpackaging=jar
mvn $GOAL -DrepositoryId=vertispan-releases -Durl=https://repo.vertispan.com/j2cl -Dfile=jre.js.zip -DgroupId=$GROUP_ID -DartifactId=jre -Dversion=0.1-SNAPSHOT -Dtype=zip -Dclassifier=jszip -Dpackaging=zip
popd