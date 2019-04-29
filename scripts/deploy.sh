#!/bin/bash
DEPLOY_PATH=$(ls /tmp/*.jar)
echo "deploy_path: $DEPLOY_PATH"
JAR_NAME=$(basename $DEPLOY_PATH)
echo "> build 파일명: $JAR_NAME"

echo "> spring-boot-demo.jar 교체"
APPLICATION_HOME=/home/ec2-user/
APPLICATION_JAR_NAME=demo.jar
APPLICATION_JAR=$APPLICATION_HOME$APPLICATION_JAR_NAME

cp $DEPLOY_PATH $APPLICATION_JAR

echo "> 실행중인 어플리케이션이 존재하는 경우 중지"
pgrep -f $APPLICATION_JAR_NAME | xargs kill

echo "> $APPLICATION_JAR 배포"
sudo -u ec2-user nohup java -jar $APPLICATION_JAR > /dev/null 2> /dev/null < /dev/null &