#!/bin/bash

while read line; do
  if [[ "$line" =~ (http:.*acme-challenge[^ ]*) ]]; then # this line has the challenge URL (and some trailing garbage)
    CHALLENGE_URL=${BASH_REMATCH[1]}
  elif [ -n "$CHALLENGE_URL" ] && [ -z "$CHALLENGE_CODE" ] && [ -n "$line" ]; then # the challenge CODE is the following non-empty line
    CHALLENGE_CODE=$line
  fi
done

echo "CHALLENGE_URL=$CHALLENGE_URL"
echo "CHALLENGE_CODE=$CHALLENGE_CODE"
