#!/usr/bin/env bash
source ./auth_helper.sh

###############################################################################
# Call the HelloWorld REST Service by using DX to manage authentication.
# Parameters
# $1 - The scratch org alias.
###############################################################################
function main(){
	getEnvVars $1 && callGetHelloWorld $ACCESS_TOKEN $SF_URL
	echo ""
}

SCRATCH_ORG_ALIAS='testing_example'

main $SCRATCH_ORG_ALIAS