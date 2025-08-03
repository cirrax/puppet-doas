# doas puppet module

[![Coverage Status](https://coveralls.io/repos/github/cirrax/puppet-doas/badge.svg)](https://coveralls.io/github/cirrax/puppet-doas)


#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with doas](#setup)
3. [Usage - Configuration options and additional functionality](#usage)
5. [Development - Guide for contributing to the module](#development)

## Description

This puppet module is intended to configure doas (the equivalent of sudo) on an OpenBSD system.

## Setup

Include the module, with:

    include doas

## Usage

To allow icinga to execute 'syspatch -c' (this shows if syspatches to update are available), you add to your hiera hieranrchy:

    doas::entries:
      icinga2_syspatch:
        identity: '_icinga'
        as_target: 'root'
        command: '/usr/sbin/syspatch'
        args:
          - '-c'
        options:
          - 'nopass'

## Reference
See [REFERENCE.md](https://github.com/cirrax/puppet-doas/blob/master/REFERENCE.md)

## Contributing

Please report bugs and feature request using GitHub issue tracker.

For pull requests, it is very much appreciated to check your Puppet manifest with puppet-lint
and the available spec tests  in order to follow the recommended Puppet style guidelines
from the Puppet Labs style guide.

### Authors

This module is mainly written by [Cirrax GmbH](https://cirrax.com).

See the [list of contributors](https://github.com/cirrax/puppet-doas/graphs/contributors)
for a list of all contributors.
