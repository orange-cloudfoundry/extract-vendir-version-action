#!/bin/bash

set -e

echo "*** Inputs ***"
echo "  vendir_file: $INPUT_VENDIR_FILE"
echo "  library: $INPUT_LIBRARY"
echo "  type: $INPUT_TYPE"
echo "  debug: $INPUT_DEBUG"


echo "Vendir file:"
ls -l $INPUT_VENDIR_FILE

case $INPUT_TYPE in
githubRelease)
  filter=".githubRelease.tag"
  ;;
*)
  echo "ERROR: undefined type"
  exit 1
esac

printf '.directories[0].contents[] | select (.path=="'$INPUT_LIBRARY'") | '>filter.query
printf "$filter" >>filter.query
cat filter.query
version=$(yq -r --from-file filter.query "$INPUT_VENDIR_FILE")


# https://docs.github.com/en/actions/using-workflows/workflow-commands-for-github-actions#environment-files
echo "version=${version}" >> "$GITHUB_OUTPUT"

