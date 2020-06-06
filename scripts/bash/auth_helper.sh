#!/usr/bin/env bash

###############################################################################
# Call Hello World
#
# Parameters
# $1 - The session Id
# $2 - The instance
###############################################################################
function callGetHelloWorld(){
	URL="$2services/apexrest/HelloWorld"
	curl -H "Authorization: Bearer $1" -H "Content-Type: application/json" -H "X-PrettyPrint: 1" $URL 
}

###############################################################################
# Find the info about the scratch org. This is used to get the access token 
# and org url.
#
# Parameters
# $1 - The Org Alias
###############################################################################
function getOrgInfo(){
	sfdx force:org:display -u $1 --verbose --json
}

###############################################################################
# Given an org alias, finds the scratch org's instance URL
#
# Parameters
# $1 - The Org Alias
###############################################################################
getInstanceUrl(){
  JSON=$(getOrgInfo $1)
  SF_URL=$(echo $JSON | jq -r '.result.instanceUrl')
  echo $SF_URL
}

###############################################################################
# Get the access token and url with jq.
#
# Parameters
# $1 - The Org Alias
###############################################################################
function getEnvVars(){
	JSON=$(getOrgInfo $1)
	ACCESS_TOKEN=$(echo $JSON | jq -r '.result.accessToken')
	SF_URL=$(echo $JSON | jq -r '.result.instanceUrl')
  
  TEMP=${SF_URL#"https://"} # Remove prefix.
  SF_DOMAIN=${TEMP%"/"} # Remove suffix
}