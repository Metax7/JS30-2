#!/bin/bash

# Exit if any of the intermediate steps fail
set -e

# Extract "foo" and "baz" arguments from the input into
# FOO and BAZ shell variables.
# jq will ensure that the values are properly quoted
# and escaped for consumption by the shell.
eval "$(jq -r '@sh "SIZE=\(.size) SCHEME=\(.encode)"')"

# Placeholder for whatever data-fetching logic your script implements
CIPHERKEY=(openssl rand -${SCHEME} ${SIZE})

# Safely produce a JSON object containing the result value.
# jq will ensure that the value is properly quoted
# and escaped to produce a valid JSON string.
jq -n --arg cipherkey "$CIPHERKEY" '{"cipherkey":$cipherkey}'