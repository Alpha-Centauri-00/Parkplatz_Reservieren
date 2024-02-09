# booking a spot

### Setting Up and Managing a Python Virtual Environment

## Instructions
A virtual environment is a self-contained Python environment that allows you to manage dependencies and isolate project-specific packages. This guide will walk you through creating and managing a virtual environment.

### Create a Virtual Environment

```bash
# Create a new virtual environment named 'venv'
python -m venv venv 
```

### Install Dependencies

While the virtual environment is activated To install dependencies from the requirements.txt file in a new environment, use pip to install your project dependencies:
```bash
pip install -r requirements.txt
```

### init-Browser
after we install all dependenceies in our project we still need to initiate Robotframework-Browser library to install browsers that we need to run our tests. we have to run this command at the end:

```bash
rfbrowser init
```

### Finally Run Test Case
run the test case inside imBook.robot to reserve a place for your car.

Enjoy :)
