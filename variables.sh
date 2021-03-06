#!/usr/bin/env bash

current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $current_dir/prints.sh # Get variables from variables.

# All Variables here: https://docs.gitlab.com/ee/ci/variables/predefined_variables.html#variables-reference, strating with CUSTOM_ENV_

CONTAINER_ID="runner-$CUSTOM_ENV_CI_RUNNER_ID-project-$CUSTOM_ENV_CI_PROJECT_ID-concurrent-$CUSTOM_ENV_CI_CONCURRENT_PROJECT_ID-$CUSTOM_ENV_CI_JOB_ID"
ARCH="$(echo $CUSTOM_ENV_CI_RUNNER_EXECUTABLE_ARCH | cut -d'/' -f2)" # linux/amd64
CURRENT_VERSION="stable"
DEBIAN_VERSION="buster"
#CURRENT_VERSION=$(echo $CUSTOM_ENV_CI_DEFAULT_BRANCH | cut -d'-' -f2) # buster-unstable, buster-testing, buster-stable...
#DEBIAN_VERSION=$(echo $CUSTOM_ENV_CI_COMMIT_REF_NAME | cut -d'-' -f1) # CUSTOM_ENV_CI_COMMIT_REF_NAME is the target branch of the MR: stretch-unstable, buster-unstable...
PROJECT_DIR="$CUSTOM_ENV_CI_PROJECT_DIR"
PROJECT_NAME="$CUSTOM_ENV_CI_PROJECT_NAME"

# For example yunohost-buster-unstable
BASE_IMAGE="yunohost-$DEBIAN_VERSION-$CURRENT_VERSION"
