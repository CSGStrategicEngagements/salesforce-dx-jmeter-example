#!/usr/bin/env bash

###############################################################################
# This script is an example of how to download Event Log files from Salesforce.
# It leverages the Salesforce CLI for managing authenticating with Salesforce.
#
# Dependencies
#		- Salesforce CLI: https://developer.salesforce.com/tools/sfdxcli
#		- jq: https://stedolan.github.io/jq/
#
# Usage
# The file doesn't have a main function. Rather it is designed to be 
# loaded into the terminal (sourced) and then individual functions can be ran.
#
# Prerequsites
# After install the dependencies, authenticate in the terminal against the 
# target Salesforce Org. Instructions are here: 
# https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_auth_web_flow.htm
# 
# Examples
# 1. Source the script.
#		Run: source ./download_event_file.sh
#
# 2. Get a list of the number of log files per event type.
#		Run: listAvailableFilesByEventType
#
#	3. Find the ID of the latest log file of a specific log type.
#		Run: findLogFilesIdByType <Event Type>
#
# 4. Download the contents of a log file and save it as a CSV file.
#		Run: getLogFileContents <record ID> <Output File Name>
###############################################################################

###############################################################################
# List the available files.
#
# Parameters: None
###############################################################################
function listAvailableFilesByEventType(){
	query=$(cat <<-EOM
		SELECT EventType, count(id)
		FROM EventLogFile
		GROUP BY ROLLUP(EventType)
		ORDER BY count(id) DESC
	EOM
	)
	
	sfdx force:data:soql:query -q "$query"
}

###############################################################################
# List the ID, Event Type and Log date for the last 10 files of a specified 
# event type.
#
# Parameters:
# 	- $1: The type of event file to find.
#
# Usage
#	findLogFilesIdByType ApexExecution
###############################################################################
function findLogFilesIdByType(){
	if [[ "$#" -eq 1 ]]; then
		query=$(cat <<-EOM
			SELECT ID, EventType, LogDate
			FROM EventLogFile
			WHERE EventType = '$1'
			ORDER BY LogDate DESC
			LIMIT 10 
		EOM
		)
		
		sfdx force:data:soql:query -q "$query"
	else
		MSG=$(cat <<-EOM
			Sorry, you need to provide 1 parameter.
			Parameters
			- Parameter 1: The Event Type name.
			
			Example: 
			findLogFilesIdByType ApexExecution
		EOM
		)
		echo "$MSG"
	fi
}

###############################################################################
# Internal Function
# Find the info about the scratch org. This is used to get the access token 
# and org url.
#
# Parameters: None
###############################################################################
function getOrgInfo(){
	sfdx force:org:display --verbose --json
}

###############################################################################
# Internal Function
# Get the access token and url with jq.
#
# Parameters: None
###############################################################################
function getEnvVars(){
	JSON=$(getOrgInfo)
	ACCESS_TOKEN=$(echo $JSON | jq -r '.result.accessToken')
	SF_URL=$(echo $JSON | jq -r '.result.instanceUrl')
}

###############################################################################
# Download an Event Log File's contents, decode it and save locally
#
# Parameters
# $1 - The record ID (from EventLogFile object) of the event log file to download.
# $2 - The name (including extension) of the file to save to.
#
# Usage
# getLogFileContents 0AT22000001ONq4GAG temp.csv
###############################################################################
function getLogFileContents(){
	if [[ "$#" -eq 2 ]]; then
		RECORD_ID=$1
		FILE_NAME=$2
		getEnvVars && 
		URL="${SF_URL}/services/data/v48.0/sobjects/EventLogFile/${RECORD_ID}/LogFile" &&
		#echo $URL
		curl -H "Authorization: Bearer $ACCESS_TOKEN" \
			-H "Content-Type: application/json" \
			-H "X-PrettyPrint: 1" $URL -o $FILE_NAME
	else
		MSG=$(cat <<-EOM
			Sorry, you need to provide two parameters.
			Parameters
			- Parameter 1: The record ID (from EventLogFile object) of the event log file to download.
			- Parameter 2: The name (including extension) of the file to save to.
			
			Example: 
			getLogFileContents 0AT22000001ONq4GAG temp.csv
		EOM
		)
		echo "$MSG"
	fi 
}

function howMuch(){
	query=$(cat <<-EOM
		SELECT count(ID)
		FROM EventLogFile
		WHERE Interval = 'Daily' and CreatedDate > 2020-03-22T00:00:00Z
	EOM
	)
		
		sfdx force:data:soql:query -q "$query"
}