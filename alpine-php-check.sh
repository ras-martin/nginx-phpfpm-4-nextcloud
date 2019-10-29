#!/bin/bash

ALPINE_VERSION="v3.10"
CURRENT_PHP_VERSION=`cat CURRENT_PHP_VERSION`
TMP_DIR=tmp_alpine_phpversion_check

mkdir -p $TMP_DIR
cd $TMP_DIR

curl -s http://dl-cdn.alpinelinux.org/alpine/${ALPINE_VERSION}/community/x86_64/APKINDEX.tar.gz -o apkindex-community.tar.gz

tar -zxf apkindex-community.tar.gz

AVAILABLE_PHP_VERSION=`grep -A1 'P:php7-fpm' APKINDEX | grep -o '[0-9].[0-9].[0-9*]*'`

if [ "$CURRENT_PHP_VERSION" = "$AVAILABLE_PHP_VERSION" ];
then
    echo "Result: OK"
    echo "Available PHP Version is equals current PHP Version: $AVAILABLE_PHP_VERSION = $CURRENT_PHP_VERSION"
else
    echo "Result: DIFF"
    echo "Available PHP Version differs from current PHP Version: $AVAILABLE_PHP_VERSION <> $CURRENT_PHP_VERSION"
fi

cd ..
rm -rf $TMP_DIR
