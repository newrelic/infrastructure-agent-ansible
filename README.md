[![New Relic Community Plus header](https://raw.githubusercontent.com/newrelic/open-source-office/master/examples/categories/images/Community_Plus.png)](https://opensource.newrelic.com/oss-category/#community-plus)

# Ansible role for the New Relic infrastructure agent [![Build Status](https://travis-ci.org/newrelic/infrastructure-agent-ansible.svg?branch=master)](https://travis-ci.org/newrelic/infrastructure-agent-ansible)

This role installs and configures the New Relic infrastructure agent.

Note that this is a simple role and is intended for you to use as a starting place for your own customized workflow.

## Installing and using the Ansible role

### What `newrelic-infra` affects

* Adds New Relic's package repository source.
* Installs and configures the New Relic infrastructure agent.

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

##### `nrinfragent_yum_lock_timeout` (Optional)

Used to set lock_timeout value for ansible yum module. When it's not set this value defaults to 30. Works only for ansible version >= 2.8.0

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

Should you need assistance with New Relic products, you are in good hands with several support diagnostic tools and support channels.

If the issue has been confirmed as a bug or is a feature request, file a GitHub issue.

**Support Channels**

* [New Relic Documentation](https://docs.newrelic.com): Comprehensive guidance for using our platform
* [New Relic Community](https://discuss.newrelic.com/c/support-products-agents/new-relic-infrastructure): The best place to engage in troubleshooting questions
* [New Relic Developer](https://developer.newrelic.com/): Resources for building a custom observability applications
* [New Relic University](https://learn.newrelic.com/): A range of online training for New Relic users of every level
* [New Relic Technical Support](https://support.newrelic.com/) 24/7/365 ticketed support. Read more about our [Technical Support Offerings](https://docs.newrelic.com/docs/licenses/license-information/general-usage-licenses/support-plan).

## Privacy

At New Relic we take your privacy and the security of your information seriously, and are committed to protecting your information. We must emphasize the importance of not sharing personal data in public forums, and ask all users to scrub logs and diagnostic information for sensitive information, whether personal, proprietary, or otherwise.

We define “Personal Data” as any information relating to an identified or identifiable individual, including, for example, your name, phone number, post code or zip code, Device ID, IP address, and email address.

For more information, review [New Relic’s General Data Privacy Notice](https://newrelic.com/termsandconditions/privacy).

## Contribute

We encourage your contributions to improve this project! Keep in mind that when you submit your pull request, you'll need to sign the CLA via the click-through using CLA-Assistant. You only have to sign the CLA one time per project.

If you have any questions, or to execute our corporate CLA (which is required if your contribution is on behalf of a company), drop us an email at opensource@newrelic.com.

**A note about vulnerabilities**

As noted in our [security policy](../../security/policy), New Relic is committed to the privacy and security of our customers and their data. We believe that providing coordinated disclosure by security researchers and engaging with the security community are important means to achieve our security goals.

If you believe you have found a security vulnerability in this project or any of New Relic's products or websites, we welcome and greatly appreciate you reporting it to New Relic through [HackerOne](https://hackerone.com/newrelic).

If you would like to contribute to this project, review [these guidelines](./CONTRIBUTING.md).

To all contributors, we thank you!  Without your contribution, this project would not be what it is today.

## License

infrastructure-agent-ansible is licensed under the [Apache 2.0](http://apache.org/licenses/LICENSE-2.0.txt) License.

[1]: https://docs.newrelic.com/docs/integrations/host-integrations/host-integrations-list
[2]: https://github.com/search?l=&p=1&q=nri-+user%3Anewrelic&ref=advsearch&type=Repositories&utf8=%E2%9C%93
[3]: https://galaxy.ansible.com/newrelic/newrelic-infra
