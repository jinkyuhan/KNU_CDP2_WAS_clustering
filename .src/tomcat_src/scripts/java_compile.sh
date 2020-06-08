#!/bin/bash
cd "$(dirname "$0")"

echo "########################################"
echo ""
echo "java_compile.sh"
echo ""
echo "########################################"

# reference
# https://m.blog.naver.com/PostView.nhn?blogId=sakangs&logNo=110153627869&proxyReferer=https:%2F%2Fwww.google.com%2F

USER_APP_NAME="example-project"
USER_APP_PATH=$CATALINA_HOME/webapps/$USER_APP_NAME

JAVABEANS_PATH=$USER_APP_PATH/WEB-INF/classes
mkdir -p $JAVABEANS_PATH
if [ $? -ne 0 ]
then
    echo "Failed!"
    exit 1
fi

# check if user app has packages
cd $USER_APP_PATH/src
ls | while read each
do
    if [ -d "$each" ]; then
        # if it is a package
        javac $each/*.java
        mkdir -p $JAVABEANS_PATH/$each
        mv $each/*.class $JAVABEANS_PATH/$each
        echo $(ls $JAVABEANS_PATH/$each)
    elif [ -f "$each" ]; then
        if [ ${each#*.} = "java" ]; then
            # if it is a java file
            javac $each
            mkdir -p $JAVABEANS_PATH/default
            mv ${each%.*}.class $JAVABEANS_PATH/default
            echo $(ls $JAVABEANS_PATH/default)
        fi
    fi
done

exit 0