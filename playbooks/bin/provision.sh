#!/bin/bash
shopt -s nullglob

ENVIRONMENTS=(uat production)

show_usage() {
  echo "Usage: provision <environment> <site name> [options]

<environment> is the environment to deploy to ("uat", "production", etc)
[options] is any number of parameters that will be passed to ansible-playbook

Available environments:
`( IFS=$'\n'; echo "${ENVIRONMENTS[*]}" )`

Examples:
  provision server
  provision production
  provision uat -vv -T 60
"
}

[[ $# -lt 1 ]] && { show_usage; exit 127; }

for arg
do
  [[ $arg = -h ]] && { show_usage; exit 0; }
done

ENV="$1"; shift
EXTRA_PARAMS=$@
DEPLOY_CMD="docker-compose exec ansible ansible-playbook provision.yml -e env=$ENV $EXTRA_PARAMS --flush-cache"
PARENT_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
HOSTS_FILE="$PARENT_PATH/../inventory.ini"

if [[ ! -e $HOSTS_FILE ]]; then
  echo "Error: $ENV is not a valid environment ($HOSTS_FILE does not exist)."
  echo
  echo "Available environments:"
  ( IFS=$'\n'; echo "${ENVIRONMENTS[*]}" )
  exit 1
fi

echo $DEPLOY_CMD
$DEPLOY_CMD
