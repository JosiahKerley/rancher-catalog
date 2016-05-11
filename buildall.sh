#!/bin/bash
BASE=josiahkerley
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "${DIR}"
for BUILD in `find ./ | grep 'Dockerfile$'`
do
  cd `dirname ${BUILD}`
  TAG=`pwd | rev| cut -d'/' -f1 | rev`
  docker build -t ${TAG} .
  docker tag ${TAG} ${BASE}/${TAG}
  docker push ${BASE}/${TAG}
  cd "${DIR}"
done
docker images | grep "${BASE}"