#!/bin/bash
#script to load previuos defined environment
source config.sh

#exports
export SCRAM_ARCH=$SCRAM

#setting up  cmssw user for github developements
git config --global user.github $GITUSER

#creating cmssw workspace
cd $CMSSW/src
cmsenv
