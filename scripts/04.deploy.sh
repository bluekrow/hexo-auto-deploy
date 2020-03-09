#!/bin/sh

echo "PUSH CHANGES TO REMOTE DESTINATION BRANCH"
cd ${INPUT_DEPLOY_DIR}
git add .
git commit -m "${INPUT_COMMIT_MESSAGE}"
if [ "$DEPLOY_BRANCH_EXISTS" == 1 ]; then
  git push
else
  git push -u origin ${INPUT_DEPLOY_BRANCH}
fi
echo ""