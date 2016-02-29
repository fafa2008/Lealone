#!/bin/sh

#  Licensed to the Apache Software Foundation (ASF) under one or more
#  contributor license agreements.  See the NOTICE file distributed with
#  this work for additional information regarding copyright ownership.
#  The ASF licenses this file to You under the Apache License, Version 2.0
#  (the "License"); you may not use this file except in compliance with
#  the License.  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
if [ "x$LEALONE_HOME" = "x" ]; then
    LEALONE_HOME="`dirname "$0"`/.."
fi

if [ "x$JAVA_HOME" = "x" ]; then
    echo JAVA_HOME environment variable must be set!
    exit 1;
fi

LEALONE_MAIN=org.lealone.main.Shell

JAVA_OPTS=-Dlogback.configurationFile=logback.xml

CLASSPATH=$LEALONE_HOME/conf

for jar in "$LEALONE_HOME"/lib/*.jar; do
    CLASSPATH="$CLASSPATH:$jar"
done

LEALONE_CLASSPATH="$CLASSPATH"
LEALONE_PARAMS="-Dlealone.logdir=$LEALONE_HOME/logs"
# LEALONE_PARAMS="$LEALONE_PARAMS -agentlib:jdwp=transport=dt_socket,address=8000,server=y,suspend=y"


"$JAVA_HOME/bin/java" $JAVA_OPTS $LEALONE_PARAMS -cp $LEALONE_CLASSPATH $LEALONE_MAIN