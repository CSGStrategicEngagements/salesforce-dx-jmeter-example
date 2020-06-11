# Setting Things Up

---

## Install Project Dependencies

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

# Install the NPM dependencies declared in the package.json file.
npm install
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
