[![Community Project header](https://github.com/newrelic/opensource-website/raw/master/src/images/categories/Community_Project.png)](https://opensource.newrelic.com/oss-category/#community-project)

# Ansible role for the New Relic infrastructure agent [![Build Status](https://travis-ci.org/newrelic/infrastructure-agent-ansible.svg?branch=master)](https://travis-ci.org/newrelic/infrastructure-agent-ansible)

This role installs and configures the New Relic infrastructure agent.

Note that this is a simple role and is intended for you to use as a starting place for your own customized workflow.

## Installing and using the Ansible role for New Relic infrastructure

### What `newrelic-infra` affects

* Adds the New Relic Infrastructure package repository source.
* Installs and configures the New Relic Infrastructure agent.

### Getting started with the role

Start by including the role in your playbook and customize the required variables.

All typical interactions with `newrelic-infra` are done through role configuration.

### Install the infrastructure agent using the role

Use the following snippet to install the agent.

```yaml
---
- hosts: ap_ne_1
  roles:
    - name: newrelic.newrelic-infra
      vars:
        nrinfragent_config:
          license_key: YOUR_LICENSE_KEY
          log_file: /var/log/nr-infra.log
          log_to_stdout: false
```

## Reference

### Role configuration

#### Variables

##### `nrinfragent_config` (Required)

Used to populate the agent configuration. At a minimum you must provide `license_key`. For current configuration options, see the [New Relic documentation](https://docs.newrelic.com/docs/infrastructure/new-relic-infrastructure/configuration/configure-infrastructure-agent).

##### `nrinfragent_state` (Optional)

Describes what you want to do with the agent:

* `'latest'` - [default] install the latest version of the agent. Also `present`.
* `'absent'` - Uninstall the agent.

##### `nrinfragent_os_name` (Optional)

Specifies the target OS that the infrastructure agent will be installed on. Defaults to `ansible_os_family`. For a list of supported operating systems, see the `meta/main.yml` file.

##### `nrinfragent_os_version` (Optional)

Specifies the OS version of the installer package needed for this machine. Defaults to `ansible_lsb.major_release`. Mostly used for `RedHat` family OSs. For a list of supported operating systems, see the `meta/main.yml` file.

##### `nrinfragent_os_codename` (Optional)

Specifies the OS codename of the installer package needed for this machine. Defaults to `ansible_lsb.codename`. Mostly used for `Debian` family OSs. For a list of supported operating systems, see the `meta/main.yml` file.

##### `nrinfragent_choco_version` (Optional)

Specifies the version of the Chocolatey package to install `newrelic-infra` on Windows. Can be used to pin the version or upgrade the agent.

##### `nrinfragent_service_state` (Optional)

Specifies the state of the `newrelic-infra` service after install. Defaults to `started`, which ensures the service will be running. You can change it to `stopped` to just install it, without starting it right away.

##### `nrinfragent_service_enabled` (Optional)

Specifies if the service will start during boot. Defauts to `yes`; change it to `no` to prevent the service to automatically start on boot.

##### `nrinfragent_integrations` (Optional)

Specifies the infrastructure integrations to be installed. The list of available integrations can be found [here][1].

Each package should provide its `name` and `state`. The integrations package name is located in the **Install and activate** section of the [individual integrations docs](https://docs.newrelic.com/docs/integrations). As a convention, their name is the name of the service with the `nri-` prefix (`nri-apache`, `nri-redis`, etc.).

By default the state it's `absent`, which doesn't install the package; you can change it to `latest` or `present`. For example:

```
nrinfragent_integrations:
  - { name: nri-nginx, state: "latest" }
  - { name: nri-mysql, state: "absent" }
```

The source code for each integration is available on [newrelic's GitHub organization][2].

#### Removing the `newrelic-infra-integrations` package and its bundled integrations

> This only applies if you have the `newrelic-infra-integrations` package installed

If you want to remove the `newrelic-infra-integrations` package or any of the bundled integrations (nri-redis, nri-cassandra, nri-apache, nri-nginx, nri-mysql), add `newrelic-infra-integrations` as the first item of `nrinfragent_integrations` with the state `absent`.

```
nrinfragent_integrations:
  - { name: newrelic-infra-integrations, state: "absent" }
```

###### Deprecated

You can specify the license key for backward compatibility. We recommend that you use `license_key` in `nrinfragent_config` instead. If both are specified, the one in `nrinfragent_config` takes precedence.

## Compatibility

### Platforms

* RHEL/CentOS
  * RHEL/CentOS 8
  * RHEL/CentOS 7
  * RHEL/CentOS 6
  * RHEL/CentOS 5
* Ubuntu
  * 18 Bionic
  * 16 Xenial
  * 14 Trusty
  * 12 Precise
* Debian
  * 10 Buster
  * 9 Stretch
  * 8 Jessie
  * 7 Wheezy
* SUSE Linux Enterprise
  * 12
* Windows
  * All
  * _Disclaimer_: Windows support depends on the third-party [newrelic-infra Chocolatey package](https://chocolatey.org/packages/newrelic-infra), which
    is maintained by @ripclawffb and @xandrellas. It is distributed without any guarantee or support from New Relic.

### Release to Ansible Galaxy

To release a new version to [Ansible Galaxy][3] follow this steps:

* Update the [CHANGELOG.md](CHANGELOG.md)
* Create a new GitHub release.
* Make sure the version is imported into [Ansible Galaxy][3], if there is any issue, ask one of the project owners.

## Support

New Relic hosts and moderates an online forum where customers can interact with New Relic employees as well as other customers to get help and share best practices. Like all official New Relic open source projects, there's a related Community topic in the New Relic Explorers Hub. You can find this project's topic/threads here:

https://discuss.newrelic.com/c/support-products-agents/new-relic-infrastructure


## Contributing

We encourage contributions to improve New Relic infrastructure agent Ansible role! Keep in mind when you submit your pull request, you'll need to sign the CLA via the click-through using CLA-Assistant. You only have to sign the CLA one time per project.
If you have any questions, or to execute our corporate CLA, required if your contribution is on behalf of a company,  please drop us an email at opensource@newrelic.com.

## License
New Relic infrastructure agent Ansible role is licensed under the [Apache 2.0](http://apache.org/licenses/LICENSE-2.0.txt) License.

[1]: https://docs.newrelic.com/docs/integrations/host-integrations/host-integrations-list
[2]: https://github.com/search?l=&p=1&q=nri-+user%3Anewrelic&ref=advsearch&type=Repositories&utf8=%E2%9C%93
[3]: https://galaxy.ansible.com/newrelic/newrelic-infra
