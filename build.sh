#!/usr/bin/env bash

export VERSION=`cat VERSION`

NGINX_STAGING_CONF="staging.conf"
NGINX_DEV_CONF="dev.conf"

DOCKER_IMAGE="recifegourmet-nginx"

TAG_SUFFIX_STAGING='-beta'
TAG_SUFFIX_DEV='-alpha'

url_escape() {
  echo $1 | sed -e 's/\//\\\//g'
}

build() {
  nginx_conf=$1
  tag_suffix=$2

  cp "$nginx_conf" default.conf
  docker build -t $DOCKER_IMAGE:$VERSION$tag_suffix .
}

build $NGINX_DEV_CONF $TAG_SUFFIX_DEV
