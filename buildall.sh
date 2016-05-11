#!/bin/bash
BASE=josiahkerley
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "${DIR}"
for BUILD in `find ./ | grep 'Dockerfile$'`
do
  cd `dirname ${BUILD}`
  TAG=${BASE}/`pwd | rev| cut -d'/' -f1 | rev`
  docker build -t ${TAG} .
<<<<<<< HEAD
  docker tag ${TAG} ${DOCKER_REPO}${TAG}
  docker push ${DOCKER_REPO}${TAG}
=======
>>>>>>> origin/master
  cd "${DIR}"
done
docker images | grep "${BASE}"