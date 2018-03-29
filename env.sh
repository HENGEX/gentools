#!/bin/bash

#defines
CMSSW=CMSSW_10_1_0
SCRAM=slc6_amd64_gcc630
GITUSER=omazapa

#export
export SCRAN_ARCH=$SCRAM

#setting up  cmssw user for github developements

git config --global user.github $GITUSER


#creating cmssw workspace
cmsrel $CMSSW
cd $CMSSW/src
cmsenv
git cms-init
git clone git@github.com:HENGEX/GeneratorInterface.git

#setting up Gen Production modules
#https://twiki.cern.ch/twiki/bin/viewauth/CMS/GitRepositoryForGenProduction

mkdir -p Configuration/GenProduction/
git clone git@github.com:cms-sw/genproductions.git Configuration/GenProduction/

#init voms
voms-proxy-init --voms cms --valid 168:00
