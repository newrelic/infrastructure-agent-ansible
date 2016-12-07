# infra-agent-ansible

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with infra-agent-ansible](#setup)
    * [What infra-agent-ansible affects](#what-infra-agent-ansible-affects)
    * [Beginning with infra-agent-ansible](#beginning-with-infra-agent-ansible)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the role is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)

## Description

This role installs and configures the New Relic Infrastructure agent.

Note that this is a simple role and is intended for you to use as a starting
place for your own customized workflow.

## Setup

### What infra-agent-ansible affects

- Adds the New Relic Infrastructure package repository source
- Installs and configures the New Relic Infrastructure agent

### Beginning with infra-agent-ansible

Include the role in your playbook. Customize the required variables.

## Usage

All typical interactions with `infra-agent-ansible` will be done through role configuration.

### Installing the Infrastructure agent

```yaml
- { role: infra-agent-ansible, license_key: YOUR_LICENSE_KEY }
```

## Reference

### Role Configuration

#### Variables

##### `agent_state` (OPTIONAL)

Describes what you want to do with the agent:

* `'latest'` - [default] install the latest version of the agent. Also `present`.
* `'absent'` - Uninstall the agent.


##### `agent_version` (OPTIONAL)

What version of the agent do you want to install:

* `'*'`       - [default] install the latest version of the agent.
* `'X.Y.ZZZ'` - string of the specific version number you want to install, e.g.  1.0.280

##### `os_name` (OPTIONAL)

Specifies the target OS that the Infrastructure agent will be installed on.
Defaults to `ansible_os_family`. See list in the `meta/main.yml` file for latest list that is supported.

##### `os_version` (OPTIONAL)

Specifies the OS version of the installer package needed for this machine.
Defaults to `ansible_lsb.major_release`. Mostly used for `RedHat` family OSs. See list in the `meta/main.yml` file for latest list.

##### `os_codename` (OPTIONAL)

Specifies the OS codename of the installer package needed for this machine.
Defaults to `ansible_lsb.codename`. Mostly used for `Debian` family OSs. See list in the `meta/main.yml` file for latest list.

##### `license_key` (REQUIRED)

Specifies the New Relic license key to use.


## Limitations

### Platforms

- RHEL
  - CentOS 7
  - CentOS 6
- Ubuntu
  - 16 Xenial
  - 14 Trusty
  - 12 Precise
- Debian
  - 10 Buster
  - 9 Stretch
  - 8 Jessie
  - 7 Wheezy

Copyright (c) 2016 New Relic, Inc. All rights reserved.
