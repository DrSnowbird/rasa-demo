# Sara - the Rasa Demo Bot
[![Build Status](https://travis-ci.com/RasaHQ/rasa-demo.svg?branch=master)](https://travis-ci.com/RasaHQ/rasa-demo)

## :surfer: Introduction
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

## 🤖 How to install and run Sara

To install Sara, please clone the repo and run:

```
cd rasa-demo
pip install -e .
```
This will install the bot and all of its requirements.
Note that it was written in Python 3 so might not work with PY2.

## Training CORE and NLU
### Train CORE
To train the core model: `make train-core` (this will take 2h+ and a significant amount of memory to train,
if you want to train it faster, try the training command with
`--augmentation 0`). We set to this to reduce training time. 
If you want to use that, please remove the change from Makefile
To train the core model: 
```
make train-core
```

If you want to train it faster, try the training command with
`--augmentation 0`) as 
```
(modify Makefile)
as
train-core:
        python3 -m rasa_core.train -d domain.yml -s data/core -c policy.yml --debug -o models/dialogue --augmentation 0
```
## Train NLU
To train the NLU model: 
```
make train-nlu
```

## Run models
To run Sara with both these models:
```
docker run -p 8000:8000 rasa/duckling
make run-cmdline
```

There are some custom actions that require connections to external services,
specifically `ActionSubscribeNewsletter` and `ActionStoreSalesInfo`. For these
to run you would need to have your own MailChimp newsletter and a Google sheet
to connect to.

If you would like to run Sara on your website, follow the instructions
[here](https://github.com/mrbot-ai/rasa-webchat) to place the chat widget on
your website.

## 👩‍💻 Overview of the files

`data/core/` - contains stories for Rasa Core

`data/nlu` - contains example NLU training data

`demo` - contains custom action/api code

`domain.yml` - the domain file for Core

`nlu_tensorflow.yml` - the NLU config file

`policy.yml` - the Core config file

`models` - the Core models persistence folder, i.e., `models/dialogue`

```
├── augmentedmemo-only.yml
├── data
│   ├── core
│   │   ├── canthelp.md
│   │   ├── chitchat.md
│   │   ├── closetheloop.md
│   │   ├── faqs.md
│   │   ├── feedback.md
│   │   ├── get_started.md
│   │   ├── handoff.md
│   │   ├── oos.md
│   │   ├── step3_install_rasa.md
│   │   ├── step4.md
│   │   └── stories.md
│   ├── intent_description_mapping.csv
│   └── nlu
│       └── nlu.md
├── demo
│   ├── actions.py
│   ├── api.py
│   ├── community_events.py
│   ├── config.py
│   ├── gdrive_service.py
│   ├── __init__.py
│   └── __pycache__
│       ├── actions.cpython-36.pyc
│       ├── api.cpython-36.pyc
│       ├── community_events.cpython-36.pyc
│       ├── config.cpython-36.pyc
│       ├── gdrive_service.cpython-36.pyc
│       └── __init__.cpython-36.pyc
├── Dockerfile
├── domain.yml
├── endpoints.yml
├── LICENSE
├── log-rasa-core-training.pdf
├── logs
│   ├── log-rasa-core-training.pdf
│   └── pip-install-error.txt
├── Makefile
├── models
│   ├── dialogue
│   │   ├── domain.json
│   │   ├── domain.yml
│   │   ├── policy_0_KerasPolicy
│   │   │   ├── featurizer.json
│   │   │   ├── keras_model.h5
│   │   │   └── keras_policy.json
│   │   ├── policy_1_AugmentedMemoizationPolicy
│   │   │   ├── featurizer.json
│   │   │   └── memorized_turns.json
│   │   ├── policy_2_TwoStageFallbackPolicy
│   │   │   └── two_stage_fallback_policy.json
│   │   ├── policy_3_FormPolicy
│   │   │   ├── featurizer.json
│   │   │   └── memorized_turns.json
│   │   └── policy_metadata.json
│   └── nlu
│       └── current
│           ├── checkpoint
│           ├── crf_model.pkl
│           ├── entity_synonyms.json
│           ├── intent_classifier_tensorflow_embedding.ckpt.data-00000-of-00001
│           ├── intent_classifier_tensorflow_embedding.ckpt.index
│           ├── intent_classifier_tensorflow_embedding.ckpt.meta
│           ├── intent_classifier_tensorflow_embedding_encoded_all_intents.pkl
│           ├── intent_classifier_tensorflow_embedding_inv_intent_dict.pkl
│           ├── intent_featurizer_count_vectors.pkl
│           ├── metadata.json
│           └── training_data.json
├── nlu_tensorflow.yml
├── pip-install-error.txt
├── policy.yml
├── rasa_core.log
├── rasa_demo.egg-info
│   ├── dependency_links.txt
│   ├── PKG-INFO
│   ├── requires.txt
│   ├── SOURCES.txt
│   └── top_level.txt
├── README.md
├── requirements.txt
├── setup.py
└── travis_gcloud_auth.json.enc

```
### Code Style

To ensure a standardized code style we use the formatter [black](https://github.com/ambv/black).

If you want to automatically format your code on every commit, you can use [pre-commit](https://pre-commit.com/).
Just install it via `pip install pre-commit` and execute `pre-commit install` in the root folder.
This will add a hook to the repository, which reformats files on every commit.

If you want to set it up manually, install black via `pip install black`.
To reformat files execute
```
black .
```

## :gift: License
Licensed under the GNU General Public License v3. Copyright 2018 Rasa Technologies
GmbH. [Copy of the license](https://github.com/RasaHQ/rasa-demo/blob/master/LICENSE).
Licensees may convey the work under this license. There is no warranty for the work.
