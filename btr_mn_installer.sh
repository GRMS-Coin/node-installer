#!/bin/bash
# Author Alexander Khudyakov(Miner113)
# Copyright (c) 2021-2022 The GAGA developers

declare -r BLUE="\033[0;34m"
declare -r RED='\033[0;31m'
declare -r GREEN='\033[0;32m'
declare -r NC='\033[0m'

function start_setup() {
  echo -e ""
  echo -e " ${GREEN}Author Alexander Khudyakov(Miner113) ${NC}"
  echo -e ""
  echo -e "  г===¬ г===¬ г=¬г=¬ г===¬ г===¬ г===¬ г==¬ г=¬-г¬ "
  echo -e "  ¦г=¬¦ ¦г=¬¦ ¦¦L-¦¦ ¦г=¬¦ ¦г=¬¦ ¦г=¬¦ L¦-- ¦¦L¬¦¦ "
  echo -e "  ¦¦-L- ¦L=-¦ ¦г¬г¬¦ ¦L==¬ ¦¦-L- ¦¦-¦¦ -¦¦- ¦г¬L-¦ "
  echo -e "  ¦¦г=¬ ¦г¬г- ¦¦¦¦¦¦ L==¬¦ ¦¦-г¬ ¦¦-¦¦ -¦¦- ¦¦L¬¦¦ "
  echo -e "  ¦L¦=¦ ¦¦¦L¬ ¦¦¦¦¦¦ ¦L=-¦ ¦L=-¦ ¦L=-¦ г¦-¬ ¦¦-¦¦¦ "
  echo -e "  L===- L-L=- L-L-L- L===- L===- L===- L==- L--L=- "
  echo -e ""
  echo -e ""
  echo -e "${BLUE}Welcome to the GAGA node installation${NC}"
  echo -e ""
  echo -e "${RED}Do you want to install GAGA node ?${NC}"
  echo -e ""
}

function install_packages() {
  echo -e "* Package installation"
  apt-get -y -o=Dpkg::Use-Pty=0 -o=Acquire::ForceIPv4=true update
  apt-get -y -o=Dpkg::Use-Pty=0 -o=Acquire::ForceIPv4=true install curl tar ca-certificates
  cd
  curl -o app-linux-amd64.tar.gz https://assets.coreservice.io/public/package/22/app/1.0.3/app-1_0_3.tar.gz && tar -zxf app-linux-amd64.tar.gz && rm -f app-linux-amd64.tar.gz && cd ./app-linux-amd64 && sudo ./app service install
  echo -e "${GREEN}Installation GAGA node !${NC}"
  sudo ./app service start
  echo -e "${GREEN}Start GAGA node !${NC}"
  ./app status
  echo -e "${GREEN}Status GAGA node !${NC}"
  sudo ./apps/gaganode/gaganode config set --token=uphayltoyerkdatvhgbpvorx
  echo -e "${GREEN}Token GAGA node !${NC}"
  ./app restart
  echo -e "${GREEN}Restart GAGA node !${NC}"

}

function display_information() {
 echo
 echo -e "================================================================================================================================"
 echo -e "${GREEN}Installation completed GAGA node!${NC}"
 echo -e "${GREEN}Website${NC}: https://gaganode.com"
 echo -e "${GREEN}GAGA node Docs${NC}: https://docs.gaganode.com"
 echo -e "${GREEN}GAGA node start${NC}: ${RED}sudo ./app service start${NC}"
 echo -e "${GREEN}GAGA node restart${NC}: ${RED}sudo ./app restart${NC}"
 echo -e "${GREEN}GAGA node stop${NC}: ${RED}sudo ./app service stop${NC}"
 echo -e "${GREEN}Please check ${GREEN}GAGA node${NC} is running with the following command: ${GREEN}sudo ./app status${NC}"
 echo -e "================================================================================================================================"
}

start_setup
install_packages
display_information
