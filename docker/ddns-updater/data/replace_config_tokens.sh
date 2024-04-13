#!/bin/sh

# Input JSON file
input_file="/config/data/config.json"

# Substitute environment variables in the template file and set to CONFIG env
CONFIG=$(envsubst < "$input_file")

/updater/app
