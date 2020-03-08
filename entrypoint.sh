#!/bin/sh -l

echo "ENVIRONMENT VARIABLES"
echo "Token:$INPUT_TOKEN"
echo "RepoQualifiedName: $INPUT_REPO_QUALIFIED_NAME"
echo "RepoUrl: $INPUT_REPO_URL"
echo "OwnerName: $INPUT_OWNER_NAME"
echo "OwnerEMail: $INPUT_OWNER_EMAIL"
echo "CommitMessage: $INPUT_COMMIT_MESSAGE"
echo "DeployBranch: $INPUT_DEPLOY_BRANCH"
echo "DeployDir: $INPUT_DEPLOY_DIR"
echo "SourceDir: $INPUT_SOURCE_DIR"
pwd
ls