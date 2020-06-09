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

The load tests are implemented with JMeter. Since this example project leverages
scratch orgs there are a few components that must be updated every time a new
scratch org is created. We must specify _where_ the tests should point to and we
must get an _access token_ for the tests to use.

#### Finding the Scratch Org Domain

When running the tests, you must provide the _domain_ for the scratch org instance.
This is different every time a new scratch org is provisioned.

1. First find the Instance URL
   To find the scratch org instance url:

```shell
source scripts/bash/auth_helper.sh
getInstanceUrl testing_example
# Should Ouput something like
# https://force-ruby-688-dev-ed.cs52.my.salesforce.com/
```

2. From the instance URL copy the domain. For the instance URL
   https://force-ruby-688-dev-ed.cs52.my.salesforce.com/ the domain
   is _force-ruby-688-dev-ed.cs52.my.salesforce.com_. It is important
   to remove the trailing /.

#### Running JMeter

JMeter can be ran in GUI mode or headless via the terminal. Use GUI mode for creating tests
and the terminal for actually running tests.

**Test Outputs**
When running via the terminal, JMeter can generate a web dashboard and CSV files of test results.
The below snippet demonstrates how to do this.

```shell
ORG_ALIAS='testing_example'
source scripts/bash/auth_helper.sh
getEnvVars $ORG_ALIAS
jmeter -n \
  -t ./jmeter_tests/Rest_Service_Test_Examples.jmx \
  -Jsf_domain=$SF_DOMAIN \
  -Jauth_token=$ACCESS_TOKEN \
  -l results.csv \
  -e -o ./report
```

To view the report just open it in your web browser.
```shell
open report/index.html
```

You can also run the test, output the results to a CSV file and then generate the HTML report from the file. This is useful for scenerios
where you're running the test on a remote machine and need to look
at the report locally or share the results across people.

```shell
# Generate a report from an existing result CSV file.
jmeter -g results.csv -o ./report
```

## Resources
### JMeter
__Configuring JMeter__
* [JMeter Property Files](https://jmeter.apache.org/usermanual/properties_reference.html)
* [How to specify properties on the CLI](https://jmeter.apache.org/usermanual/get-started.html#override)
* [Configure Result File Properties](https://jmeter.apache.org/usermanual/properties_reference.html#results_file_config)
* [Controlling JMeter Output Results](https://www.blazemeter.com/blog/useful-jmeter-properties-save-results-save-world)
* [Options for Saving Response Data](https://www.blazemeter.com/blog/how-to-save-response-data-in-jmeter)

__Best Practices__
* [Launching JMeter](https://www.blazemeter.com/blog/5-ways-launch-jmeter-test-without-using-jmeter-gui)
* [Building Large Test Scripts](https://www.blazemeter.com/blog/how-manage-large-jmeter-scripts-jmeter-test-fragments)

__Common Challenges__
* [Common JMeter Challenges](https://www.blazemeter.com/blog/3-common-issues-when-running-jmeter-scripts-and-how-solve-them)
* [Testing OAuth Protected Services](https://www.blazemeter.com/blog/how-run-performance-tests-oauth-secured-apps-jmeter)
* [Testing Secure Services](https://www.blazemeter.com/blog/take-pain-out-load-testing-secure-web-services)