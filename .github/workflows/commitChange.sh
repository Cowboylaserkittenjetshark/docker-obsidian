#!/bin/bash
TODAY=$( date -u '+%Y-%m-%d' )
MESSAGE="chore: regenerate $FILE_TO_COMMIT for $TODAY"
SHA=$( git rev-parse "$DESTINATION_BRANCH":"$FILE_TO_COMMIT" )
CONTENT=$( base64 -i "$FILE_TO_COMMIT" )
if [[ -n "$(git status --porcelain)" ]]; then
  gh api --method PUT /repos/:owner/:repo/contents/"$FILE_TO_COMMIT" \
          --field message="$MESSAGE" \
          --field content="$CONTENT" \
          --field encoding="base64" \
          --field branch="$DESTINATION_BRANCH" \
          --field sha="$SHA"
  echo "Commited"
else
  echo "Nothing to commit"
fi
