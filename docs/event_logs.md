Working with Sheild Event Monitoring Logs

---

[Event Monitoring](https://developer.salesforce.com/docs/atlas.en-us.api_rest.meta/api_rest/using_resources_event_log_files.htm) provides insight into the underlying behavior of the Salesforce Platform.
When the user or piece of the system performs an action, events are recorded in event log files.
On a given day multiple files are generated. Each file contains a single event type.
All event log files are stored in the [EventLogFile](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_eventlogfile.htm) object. The supported event types are documented [here](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_eventlogfile_supportedeventtypes.htm).

Keep in mind, all customers don't have Event Monitoring. It is a seperate product that must be purchased
and enabled in the customers org.

## Starter Script

This demo repo includes a [starter Bash script](../scripts/bash/download_event_file.sh) for working with Event Monitoring logs. The intention is it provides an example of how to programatically work with event logs. 

### Capabilities

The starter script demonstrates:

- Leverage the Salesforce CLI for authentication.
- List the available log files in the org.
- List the ID, Event Type and Log date for the last 10 files of a specified event type.
- Download an Event Log File's contents, decode it and save locally.

### Dependencies

- [Salesforce CLI](https://developer.salesforce.com/tools/sfdxcli)
- [jq](https://stedolan.github.io/jq/)

### Usage

The script doesn't have a main function. Rather it is designed to be
loaded into the terminal (sourced) and then individual functions can be ran.

#### Prerequsites

After installing the dependencies, authenticate in the terminal against the
target Salesforce Org. Instructions are [here](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_auth_web_flow.htm)

#### Examples

1. Source the script.

```shell
source ./scripts/bash/download_event_file.sh
```

2. Get a list of the number of log files per event type.

```shell
listAvailableFilesByEventType
```

3. Find the ID of the latest log file of a specific log type.

```shell
findLogFilesIdByType <Event Type>
```

4. Download the contents of a log file and save it as a CSV file.

```shell
getLogFileContents <record ID> <Output File Name>
```
