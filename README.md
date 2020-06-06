# Salesforce DX JMeter Example

---

This is an example project for getting started with JMeter for
testing Salesforce Apex REST services.

## Getting Started

### Project Dependencies

- The Salesforce CLI
- NPM and Node.js
- Apache JMeter
- JQ: The commandline JSON query helper tool.

### Setup

After the project dependencies are installed, you need to install
the code dependencies.

1. Install code dependendencies.

```shell
npm install
```

2. Provision a scratch org and deploy the metadata.

```shell
npm run scratch:init
```

### Manually Invoking the Web Service

There is a helper Bash script for manually invoking the REST service. This
is provided to give an example of how to use the Salesforce CLI to handle
authentication. The following steps demonstrate how to use the helper script
to manually call the REST service.

1. Navigate to the script's directory.

```shell
cd scripts/bash
```

2. Give the script permission to run.

```shell
chmod +x call_hello_world.sh
```

3. Run the Script. This assumes you've already provisioned a scratch org and
   deployed the service's metadata.

```shell
./call_hello_world.sh
```

### Running the JMeter Performance Test

The load tests are implemented with JMeter.
When running the tests, you must provide the URL for the community. This is
different every time a new scratch org is provisioned.

JMeter can be ran in GUI mode or headless via the terminal. When ran from the terminal
it can generate a web dashboard of test results. The below snippet demonstrates how to do this.

The tests can be ran with the below command.

```shell
jmeter -n \
  -t ./jmeter_tests/HelloWorldRestTests.jmx \
  -Jsf_url=<the community url>
  -l results.csv \
  -e -o ./report

# Open the report
cd report
open index.html

# you can also run the test, output the results to a CSV file and then
# generate the HTML report from the file.

jmeter -g results.csv -o ./report
```

## Resources

TBD
