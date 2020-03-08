#!/bin/sh -l

echo "ENVIRONMENT VARIABLES"
echo "Token:$INPUT_TOKEN"
echo "RepoName: $INPUT_REPO_NAME"
echo "OwnerName: $INPUT_OWNER_NAME"
echo "OwnerEMail: $INPUT_OWNER_EMAIL"
echo "CommitMessage: $INPUT_COMMIT_MESSAGE"
echo "DeployBranch: $INPUT_DEPLOY_BRANCH"
echo "DeployDir: $INPUT_DEPLOY_DIR"
echo "SourceDir: $INPUT_SOURCE_DIR"
echo ""

echo "CALCULATED VARIABLES"
REPO_URL=https://github.com/${INPUT_OWNER_NAME}/${INPUT_REPO_NAME}.git
echo "RepoUrl: $REPO_URL"
REPO_URL_AUTH=https://${INPUT_OWNER_NAME}:${INPUT_TOKEN}@github.com/${INPUT_OWNER_NAME}/${INPUT_REPO_NAME}.git
echo "RepoUrlAuth: $REPO_URL_AUTH"
DEPLOY_BRANCH_EXISTS=$(git ls-remote --heads ${REPO_URL} ${INPUT_DEPLOY_BRANCH} | wc -l)
echo "DeployUrlExists: $DEPLOY_BRANCH_EXISTS"
echo ""

echo "INSTALL HEXO AND DEPENDENCIES"
npm install
npm install -g hexo-cli
echo ""

echo "CHECK INSTALLED SOFTWARE VERSIONS"
echo "git Version"
git --version
echo "node Version"
node --version
echo "npm Version"
npm -version
echo "hexo Version"
hexo -version
echo ""

echo "GENERATE STATIC FILES"
hexo clean
hexo generate
echo ""

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

echo "COPY STATIC CONTENT TO DESTINATION BRANCH"
cp -a ${INPUT_SOURCE_DIR}/. ${INPUT_DEPLOY_DIR}/
echo ""

echo "PUSH CHANGES TO DESTINATION BRANCH"
cd ${INPUT_DEPLOY_DIR}
git add .
git commit -m "${INPUT_COMMIT_MESSAGE}"
if [ "$DEPLOY_BRANCH_EXISTS" == 1 ]; then
  git push
else
  git push -u origin ${INPUT_DEPLOY_BRANCH}
fi
echo "" 

echo "DEPLOY FINALIZED"