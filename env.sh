#!/bin/bash

#defines
CMSSW="CMSSW_10_1_0"
SCRAM="slc6_amd64_gcc630"


#export
export SCRAN_ARCH=$SCRAM


#creating cmssw workspace
cmsrel $CMSSW
cd $CMSSW/src
cmsenv
git cms-init
git clone git@github.com:HENGEX/GeneratorInterface.git

#init voms
voms-proxy-init --voms cms --valid 168:00
