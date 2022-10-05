#!/bin/bash
if [[ -n "$(git status --porcelain)" ]]; then
  gh api --method PUT /repos/:owner/:repo/contents/$FILE_TO_COMMIT \
          --field message="$MESSAGE" \
          --field content="$CONTENT" \
          --field encoding="base64" \
          --field branch="$DESTINATION_BRANCH" \
          --field sha="$SHA"
fi
