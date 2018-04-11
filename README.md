# nrinfragent Ansible role

[![Build Status](https://travis-ci.org/newrelic/infrastructure-agent-ansible.svg?branch=master)](https://travis-ci.org/newrelic/infrastructure-agent-ansible)

## Description

This role installs and configures the New Relic Infrastructure agent.

Note that this is a simple role and is intended for you to use as a starting
place for your own customized workflow.

## Setup

### What nrinfragent affects

* Adds the New Relic Infrastructure package repository source
* Installs and configures the New Relic Infrastructure agent

### Beginning with nrinfragent

Include the role in your playbook. Customize the required variables.

## Usage

All typical interactions with `nrinfragent` will be done through role configuration.

### Installing the Infrastructure agent

```yaml
---
hosts: ap_ne_1
roles:
  - name: nrinfragent
    vars:
      nrinfragent_config:
        license_key: YOUR_LICENSE_KEY
        log_file: /var/log/nr-infra.log
        log_to_stdout: false
```

## Reference

### Role Configuration

#### Variables

##### `nrinfragent_state` (OPTIONAL)

Describes what you want to do with the agent:

* `'latest'` - [default] install the latest version of the agent. Also `present`.
* `'absent'` - Uninstall the agent.

##### `nrinfragent_version` (OPTIONAL)

What version of the agent do you want to install:

* `'*'` - [default] install the latest version of the agent.
* `'X.Y.ZZZ'` - string of the specific version number you want to install, e.g. 1.0.280

##### `nrinfragent_os_name` (OPTIONAL)

Specifies the target OS that the Infrastructure agent will be installed on.
Defaults to `ansible_os_family`. See list in the `meta/main.yml` file for latest list that is supported.

##### `nrinfragent_os_version` (OPTIONAL)

Specifies the OS version of the installer package needed for this machine.
Defaults to `ansible_lsb.major_release`. Mostly used for `RedHat` family OSs. See list in the `meta/main.yml` file for latest list.

##### `nrinfragent_os_codename` (OPTIONAL)

Specifies the OS codename of the installer package needed for this machine.
Defaults to `ansible_lsb.codename`. Mostly used for `Debian` family OSs. See list in the `meta/main.yml` file for latest list.

##### `nrinfragent_config` (REQUIRED)

Used to populate agent configuration. At a minimum you must provide `license_key`.
See the NewRelic documentation for current configuration options:
[https://docs.newrelic.com/docs/infrastructure/new-relic-infrastructure/configuration/configure-infrastructure-agent](https://docs.newrelic.com/docs/infrastructure/new-relic-infrastructure/configuration/configure-infrastructure-agent)

##### `nrinfragent_license_key` (REQUIRED)

Specifies the license key for your New Relic account. The agent uses this key to associate your server's metrics with your New Relic account. This setting is created as part of the standard installation process.

###### DEPRECATED

Specify the license key. For backward compatibility. Use `license_key` in
`nrinfragent_config` instead. If both are specified the one in
`nrinfragent_config` will be used.

##### `nrinfragent_display_name` (OPTIONAL)
Override the auto-generated hostname for reporting. This is useful when you have multiple hosts with the same name, since Infrastructure uses the hostname as the unique identifier for each host.

##### `nrinfragent_proxy` (OPTIONAL)
Your system may have firewall rules that require the agent to use a proxy to communicate with New Relic. If so, set the proxy URL in the form https://user:password@hostname:port. Can be HTTP or HTTPS.

##### `nrinfragent_verbose` (OPTIONAL)
When verbose is set to 0, verbose logging is off, but the agent still creates logs. Set this to 1 to create verbose logs to use in troubleshooting the agent.

##### `nrinfragent_payload_compression` (OPTIONAL)
In Infrastructure agent version 1.0.804 or higher, data sent from the agent is compressed by default. New Relic recommends not changing this setting. However, you can disable payload compression by setting either the payload_compression_level configuration setting or the NRIA_PAYLOAD_COMPRESSION environment variable to 0.


## Limitations

### Platforms

* RHEL
  * CentOS 7
  * CentOS 6
* Ubuntu
  * 16 Xenial
  * 14 Trusty
  * 12 Precise
* Debian
  * 10 Buster
  * 9 Stretch
  * 8 Jessie
  * 7 Wheezy

Copyright (c) 2017 New Relic, Inc. All rights reserved.
