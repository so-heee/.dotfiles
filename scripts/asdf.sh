#!/bin/bash

echo "### Setting Asdf..."
asdf plugin add python

echo "### Setting Python..."

local LATEST_PYTHON2_VERSION=$(asdf list all python | grep '^2\.' | grep -v '\-dev\|rc' | tail -1)
local LATEST_PYTHON3_VERSION=$(asdf list all python | grep '^3\.' | grep -v '\-dev\|rc' | grep -v 'b\d\+' | tail -1)
asdf install python "${LATEST_PYTHON2_VERSION}"
asdf install python "${LATEST_PYTHON3_VERSION}"
asdf set --home python "${LATEST_PYTHON3_VERSION}" "${LATEST_PYTHON2_VERSION}"

asdf reshim python