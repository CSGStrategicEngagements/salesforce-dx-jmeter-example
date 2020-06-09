# Getting Started with JupyterLab

---

## Dependencies

The project leverages:

1. [Python 3](https://www.python.org/)
2. [Pip](https://pip.pypa.io/en/stable/)
3. The new [Jupyter](https://jupyter.org/) IDE [JupyterLabs](https://jupyterlab.readthedocs.io/en/stable/)

To get started install the dependencies with [Homebrew](https://brew.sh/).

```shell
# Install Python 3 and Pip
brew install python3

# Install JupyterLab
pip3 install jupyterlab

# Install the Python Libraries used by the Jupyter Notebooks.
pip3 install -r requirements.txt

# Install Pandocs and Tex to enable exporting as PDF.
brew install pandoc
brew cask install mactex-no-gui
```

## Exporting to PDF
After installing Tex you've got to add the location of xelatex to your path. 
To do that, place the following line in your .bash_profile script.
```shell
export PATH=/Library/TeX/texbin:$PATH
```
If you already have JupyterLab running, restart it to get the path change.

## Using JupyterLab

Once everything is installed you can launch JuypterLab with:

```shell
jupyter lab
```

## Exploring the Test Result Data
Running the JMeter tests results in generating the results.csv file. We can use JuypterLabs
to explore the test run results.

## Related Resources
- [List of Jupyter Kernals](https://github.com/jupyter/jupyter/wiki/Jupyter-kernels)
- [Python String Formatting Cookbook](https://mkaz.blog/code/python-string-format-cookbook/)