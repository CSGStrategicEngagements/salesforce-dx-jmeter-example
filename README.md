# Salesforce DX JMeter Example
- - -
This is an example project for getting started with JMeter for 
testing Salesforce Apex REST services.

## Getting Started

### Project Dependencies

- NPM and Node.js
- The Salesforce CLI
- Apache JMeter

### Setup
After the project dependencies are installed, you need to install 
the code dependencies. 

1. Install code dependendencies.

```shell
npm install
```

2. Deploy the Scratch Org
```shell
npm run scratch
```

### Running The Tests

The load tests are implemented by combining Selenium Web Driver with JMeter.
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