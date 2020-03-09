#!/bin/sh

echo "INSTALL HEXO AND DEPENDENCIES"
npm install
npm install -g hexo-cli
echo ""

echo "CHECK INSTALLED SOFTWARE VERSIONS"
echo "git version"
git --version
echo "node version"
node --version
echo "npm version"
npm --version
echo "hexo version"
hexo --version
echo ""