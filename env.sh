#!/bin/bash

#defines
CMSSW=CMSSW_10_1_0
SCRAM=slc6_amd64_gcc630
GITUSER=omazapa

#exports
export SCRAM_ARCH=$SCRAM

#setting up  cmssw user for github developements
git config --global user.github $GITUSER


#creating cmssw workspace
cmsrel $CMSSW
cd $CMSSW/src
cmsenv
git cms-init
git clone git@github.com:HENGEX/GeneratorInterface.git

#setting up cmssw require modules modules
git cms-addpkg  Configuration/Generator 
git cms-addpkg  Configuration/EventContent
git cms-addpkg  Configuration/StandardSequences

git cms-addpkg  SimGeneral/HepPDTESSource
git cms-addpkg  SimGeneral/HepPDTRecord

git cms-addpkg  GeneratorInterface/AlpgenInterface
git cms-addpkg  GeneratorInterface/AMPTInterface
git cms-addpkg  GeneratorInterface/BeamHaloGenerator
git cms-addpkg  GeneratorInterface/CascadeInterface
git cms-addpkg  GeneratorInterface/Configuration
git cms-addpkg  GeneratorInterface/Core
git cms-addpkg  GeneratorInterface/CosmicMuonGenerator
git cms-addpkg  GeneratorInterface/EvtGenInterface
git cms-addpkg  GeneratorInterface/ExhumeInterface
git cms-addpkg  GeneratorInterface/ExternalDecays
git cms-addpkg  GeneratorInterface/GenExtensions
git cms-addpkg  GeneratorInterface/Herwig6Interface
git cms-addpkg  GeneratorInterface/Herwig7Interface
git cms-addpkg  GeneratorInterface/HiGenCommon
git cms-addpkg  GeneratorInterface/HijingInterface
git cms-addpkg  GeneratorInterface/Hydjet2Interface
git cms-addpkg  GeneratorInterface/HydjetInterface
git cms-addpkg  GeneratorInterface/LHEInterface
git cms-addpkg  GeneratorInterface/MCatNLOInterface
git cms-addpkg  GeneratorInterface/PartonShowerVeto
git cms-addpkg  GeneratorInterface/PhotosInterface
git cms-addpkg  GeneratorInterface/PomwigInterface
git cms-addpkg  GeneratorInterface/PyquenInterface
git cms-addpkg  GeneratorInterface/Pythia6Interface
git cms-addpkg  GeneratorInterface/Pythia8Interface
git cms-addpkg  GeneratorInterface/ReggeGribovPartonMCInterface
git cms-addpkg  GeneratorInterface/RivetInterface
git cms-addpkg  GeneratorInterface/SherpaInterface
git cms-addpkg  GeneratorInterface/TauolaInterface


git cms-addpkg  SimDataFormats/GeneratorProducts

#GeomBuilder has a bug, xml file dont exists
#edm::FileInPath unable to find file MagneticField/GeomBuilder/data/MagneticFieldVolumes_1_v7_large.xml anywhere in the search path.
#I fix it taking it from old cvs code.

git cms-addpkg MagneticField/GeomBuilder/
cd MagneticField/GeomBuilder/data/
wget https://raw.githubusercontent.com/cms-cvs-history/MagneticField-GeomBuilder/master/data/MagneticFieldVolumes_1_v7_large.xml
wget https://raw.githubusercontent.com/cms-cvs-history/MagneticField-GeomBuilder/master/data/MagneticFieldVolumes_2_v7_large.xml
cd ../../../

#init voms
voms-proxy-init --voms cms --valid 168:00
