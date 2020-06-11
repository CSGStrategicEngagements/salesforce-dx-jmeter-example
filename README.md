# Salesforce DX JMeter Example

---

This is an example project for getting started with JMeter for
testing Salesforce Apex REST services.

## Getting Started

### Project Dependencies
If you're on a Mac most of the project dependencies can be installed with [Homebrew](https://brew.sh/).

1. The [Salesforce CLI](https://developer.salesforce.com/tools/sfdxcli) for working with scratch orgs and metadata.
```shell
# Install the Salesforce CLI
brew install sfdx

#Update the CLI to the latest version.
sfdx update
```
2. NPM and [Node.js](https://nodejs.org/en/download/) for the overall project structure.
```shell
# Install nvm to manage Node.js and NPM.
brew install nvm

#Install the stable version of Node.js
nvm install stable
nvm use stable
```
3. [Apache JMeter](https://jmeter.apache.org/) for running tests.
```shell
brew install jmeter
```
4. [JQ](https://stedolan.github.io/jq/): The commandline JSON query helper tool.
```shell
brew install jq
```
5. [JupyterLab](https://jupyter.org/) for performing analysis. 
6. JupyterLab requires [Python 3](https://www.python.org/) and [Pip](https://pip.pypa.io/en/stable/).
```shell
# Install Python 3 and Pip
brew install python3

# Install JupyterLab
pip3 install jupyterlab

# Install the Python Libraries used by the individual Jupyter Notebooks.
pip3 install -r requirements.txt

# (Optional)Install Pandocs and Tex to enable exporting as PDF.
brew install pandoc
brew cask install mactex-no-gui
```

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

### Exploring Performance Testing
This repo demonstrates how to construct a performance testing pipeline using 
_JMeter_ and _Jupyter Notebooks_.
<img src="./images/testing_pipeline.png"
     alt="The Testing Pipeline"
     style="height: 300px" />

JMeter is responsible for running the tests and Jupyter is leveraged for 
analyzing the test results. See the below documents for details on how
to use each tool.

- [Working with the JMeter Tests](./docs/jmeter_help.md)
- [Working with tje Jupyter Notebooks](./docs/jupyter_help.md)