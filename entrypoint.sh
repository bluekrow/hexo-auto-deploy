#!/bin/sh -l

OWNER_NAME=$1
OWNER_EMAIL=$2

echo "Owner name: $OWNER_NAME"
echo "Owner email: $OWNER_EMAIL"
#echo "AUTH_TOKEN: ${{ secrets.GITHUB_TOKEN }}"
#echo "REPO_OWNER_AND_NAME: ${{ github.REPOSITORY }}"
#echo "REPO_URL: ${{ github.EVENT.REPOSITORY.CLONE_URL }}"
#echo "OWNER_NAME: ${{ github.EVENT.REPOSITORY.OWNER.NAME }}"
#echo "OWNER_EMAIL: ${{ github.EVENT.REPOSITORY.OWNER.EMAIL }}"
#echo "COMMIT_MESSAGE: ${{ github.EVENT.HEAD_COMMIT.MESSAGE }}"
#echo "DEPLOY_BRANCH: gh-pages"
#echo "DEPLOY_DIR: .deploy"
#echo "SOURCE_DIR: public"