# Working with JMeter

---

## Running the JMeter Performance Test

The load tests are implemented with JMeter. Since this example project leverages
scratch orgs there are a few components that must be updated every time a new
scratch org is created. We must specify _where_ the tests should point to and we
must get an _access token_ for the tests to use.

### Finding the Scratch Org Domain

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

### Running JMeter

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
  -Jloop_count=100 \
  -Jglobal.threads=10 \
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

**Configuring JMeter**

- [JMeter Property Files](https://jmeter.apache.org/usermanual/properties_reference.html)
- [How to specify properties on the CLI](https://jmeter.apache.org/usermanual/get-started.html#override)
- [Configure Result File Properties](https://jmeter.apache.org/usermanual/properties_reference.html#results_file_config)
- [Controlling JMeter Output Results](https://www.blazemeter.com/blog/useful-jmeter-properties-save-results-save-world)
- [Options for Saving Response Data](https://www.blazemeter.com/blog/how-to-save-response-data-in-jmeter)

**Best Practices**

- [Launching JMeter](https://www.blazemeter.com/blog/5-ways-launch-jmeter-test-without-using-jmeter-gui)
- [Building Large Test Scripts](https://www.blazemeter.com/blog/how-manage-large-jmeter-scripts-jmeter-test-fragments)

**Common Challenges**

- [Common JMeter Challenges](https://www.blazemeter.com/blog/3-common-issues-when-running-jmeter-scripts-and-how-solve-them)
- [Testing OAuth Protected Services](https://www.blazemeter.com/blog/how-run-performance-tests-oauth-secured-apps-jmeter)
- [Testing Secure Services](https://www.blazemeter.com/blog/take-pain-out-load-testing-secure-web-services)
