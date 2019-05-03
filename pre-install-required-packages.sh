#!/bin/bash -x

PYTHON=/usr/bin/python3.6

${PYTHON} -m pip install setuptools==41.0.0
${PYTHON} -m pip install pyparsing==2.4.0
${PYTHON} -m pip install pyasn1==0.4.5
${PYTHON} -m pip install pyjwt==1.7.1

${PYTHON} -m pip install -e .
