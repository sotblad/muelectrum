#!/bin/bash

VERSION_STRING=(`grep ELECTRUM_VERSION lib/version.py`)
ELECTRUM_MUE_VERSION=${VERSION_STRING[2]}
ELECTRUM_MUE_VERSION=${ELECTRUM_MUE_VERSION#\'}
ELECTRUM_MUE_VERSION=${ELECTRUM_MUE_VERSION%\'}
export ELECTRUM_MUE_VERSION
