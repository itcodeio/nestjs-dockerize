#!/bin/bash

CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
DARKGREY='\033[1;30m'
DEF='\033[0;39m'
BOLD='\033[1m'
INVERSE='\033[7m'
NORMAL='\033[0m'
WHITE_BACKGROUND='\033[47m'
RED_BRIGHT='\033[0;91m'
RED_BACKGROUND='\033[41m'
RED_BACKGROUND_BRIGHT='\033[0;101m'

function load_log_panel() {
  echo -e "\n\n${YELLOW}Loading app log panel...${NORMAL}\n"
  docker logs --tail 1000 -f app
}

function deploy() {
  echo -e "\n${YELLOW}Stopping app image...${NORMAL}\n"
  docker-compose down
  echo -e "\n${YELLOW}Clearing app volumes...${NORMAL}\n"
  docker system prune -a --volumes -f
  echo -e "\n${YELLOW}Deploying fresh app image...${NORMAL}\n"
  docker-compose up -d --build --force-recreate
}

while getopts c:t: flag
do
  case "${flag}" in
    c) choice=${OPTARG};;
    t) test=${OPTARG};;
  esac
done

#or take first argument
if [ ! $choice ]  && [ $1 ]
then
  echo ">>>>$1"
  choice=$1
fi


if [ -z $choice ]
then
  echo -e "${YELLOW}${BOLD}${INVERSE}"
  echo -e "  ----------------------------------------------------------------------  "
  echo -e "  -                           Deployment Menu                          -  "
  echo -e "  ----------------------------------------------------------------------  "
  echo -e "${DEF}"
  echo -e "        0 - App Log Panel"
  echo -e "        1 - Deploy & Restart"
  echo -e "${YELLOW}${BOLD}${INVERSE}"
  echo -e "  ----------------------------------------------------------------------  "
  echo -e "\n${RED_BACKGROUND_BRIGHT}  Don't forget to login in specific docker account(look at project docs)  ${NORMAL}"
  echo -e "${NORMAL}"
  echo -en "${CYAN}Input action number > ${NORMAL} "

  read -p "" choice
  case "$choice" in
    0 ) load_log_panel;;
    1 ) deploy;;
    * ) echo -e "\n${RED}Invalid action number${NORMAL}\n";;
  esac
else
  echo -e "${CYAN}Action:${GREEN} $choice${NORMAL}"
  $choice
fi
