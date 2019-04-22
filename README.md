# Sara - the Rasa Demo Bot
[![Build Status](https://travis-ci.com/RasaHQ/rasa-demo.svg?branch=master)](https://travis-ci.com/RasaHQ/rasa-demo)

# Introduction
The purpose of this repo is to showcase a contextual AI assistant built with the open source Rasa Stack.

Sara is an alpha version and lives in our docs, helping developers getting started with our open source tools. It supports the following user goals:

- Understanding the Rasa Stack
- Installing the Rasa Stack
- Answering some FAQs around the Rasa Stack
- Subscribing to the Rasa newsletter
- Requesting a call with Rasa's sales team
- Handling basic chitchat

You can talk to Sara [here](https://rasa.com/docs/get_started_step1/) and find planned enhancements for Sara in the
[Project Board](https://github.com/RasaHQ/rasa-demo/projects/1)

# How to install and run Sara

To install Sara, please clone the repo and run:

```
cd rasa-demo
pip install -e .
```
This will install the bot and all of its requirements.
Note that it was written in Python 3 so might not work with PY2.

# Training CORE and NLU
## Train CORE
To train the core model: 
```
make train-core
```
(this will take 2h+ and a significant amount of memory to train time)

If you want to train it faster, try the training command with
`--augmentation 0`) as 
```
make train-core --augmentation 0
```
## Train NLU
To train the NLU model: 
```
make train-nlu
```

# Run models
To run Sara with both these models:
```
docker run -p 8000:8000 rasa/duckling
make run-cmdline
```

There are some custom actions that require connections to external services,
specifically `ActionSubscribeNewsletter` and `ActionStoreSalesInfo`. For these
to run you would need to have your own MailChimp newsletter and a Google sheet
to cponnect to.

If you would like to run Sara on your website, follow the instructions
[here](https://github.com/mrbot-ai/rasa-webchat) to place the chat widget on
your website.

# Overview of the files

`data/core/` - contains stories for Rasa Core

`data/nlu` - contains example NLU training data

`demo` - contains custom action/api code

`domain.yml` - the domain file for Core

`nlu_tensorflow.yml` - the NLU config file

`policy.yml` - the Core config file

`models` - the Core models persistence folder, i.e., `models/dialogue`

```
├── demo
│   ├── actions.py
│   ├── api.py
│   ├── community_events.py
│   ├── config.py
│   ├── gdrive_service.py
│   └── __init__.py
├── domain.yml
├── endpoints.yml
├── models
│   ├── dialogue
│   │   ├── domain.json
│   │   ├── domain.yml
│   │   ├── policy_0_KerasPolicy
│   │   ├── policy_1_AugmentedMemoizationPolicy
│   │   ├── policy_2_TwoStageFallbackPolicy
│   │   ├── policy_3_FormPolicy
│   │   └── policy_metadata.json
│   └── nlu
│       └── current
├── nlu_tensorflow.yml
├── policy.yml

```
# License
Licensed under the GNU General Public License v3. Copyright 2018 Rasa Technologies
GmbH. [Copy of the license](https://github.com/RasaHQ/rasa-demo/blob/master/LICENSE).
Licensees may convey the work under this license. There is no warranty for the work.
