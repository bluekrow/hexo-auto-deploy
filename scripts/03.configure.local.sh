#!/bin/sh

echo "CONFIGURE DESTINATION BRANCH"
if [ "$DEPLOY_BRANCH_EXISTS" == 1 ]; then
    echo "Clone existent $INPUT_DEPLOY_BRANCH branch"
    git clone --single-branch --branch ${INPUT_DEPLOY_BRANCH} ${REPO_URL} ${INPUT_DEPLOY_DIR}
    cd ${INPUT_DEPLOY_DIR}
    git remote set-url origin ${REPO_URL_AUTH}
else
    echo "Initialize and push to a new $INPUT_DEPLOY_BRANCH branch"
    mkdir ${INPUT_DEPLOY_DIR}
    cd ${INPUT_DEPLOY_DIR}
    git init
    git remote add origin ${REPO_URL_AUTH}
    git checkout -b ${INPUT_DEPLOY_BRANCH}
fi
git config user.email ${INPUT_OWNER_EMAIL}
git config user.name ${INPUT_OWNER_NAME}
cd ..
echo ""

echo "COPY STATIC CONTENT TO LOCAL DESTINATION BRANCH"
cp -a ${INPUT_SOURCE_DIR}/. ${INPUT_DEPLOY_DIR}/
echo ""