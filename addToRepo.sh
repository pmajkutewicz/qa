#!/usr/bin/env bash
mkdir -p /tmp/qa/parent
mkdir -p /tmp/qa/resources
cp parent/pom.xml /tmp/qa/parent/pom.xml
cp resources/pom.xml /tmp/qa/resources/pom.xml
cp resources/target/resources-1.0-SNAPSHOT-resources.zip /tmp/qa/resources/resources-1.0-SNAPSHOT-resources.zip
git co repository
mvn install:install-file -DgroupId=pl.pamsoft.qa -DartifactId=parent -Dversion=1.0-SNAPSHOT -Dfile=/tmp/qa/parent/pom.xml -Dpackaging=pom -DgeneratePom=false -DlocalRepositoryPath=.  -DcreateChecksum=true
mvn install:install-file -DgroupId=pl.pamsoft.qa -DartifactId=resources -Dversion=1.0-SNAPSHOT -Dfile=/tmp/qa/resources/pom.xml -Dpackaging=pom -DgeneratePom=false -DlocalRepositoryPath=.  -DcreateChecksum=true
mvn install:install-file -DgroupId=pl.pamsoft.qa -DartifactId=resources -Dversion=1.0-SNAPSHOT -Dfile=/tmp/qa/resources/resources-1.0-SNAPSHOT-resources.zip -Dpackaging=zip -DgeneratePom=true -DlocalRepositoryPath=. -Dclassifier=resources -DcreateChecksum=true
-DlocalRepositoryPath=.  -DcreateChecksum=true
rm -r /tmp/qa
git add -A pl && git commit -m "released version 1.0-SNAPSHOT"
git co master
