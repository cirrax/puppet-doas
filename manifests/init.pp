# @summary configure doas
#
# define doas config on OpenBSD
#
# @param configfile
#  the configuration file to put the entries in
#
# @param entries
#  entries to append to the doas.conf file
#  this parameter has lookup_options set to hash !!
#
# @param owner
#  owner of $configfile
#
# @param group
#  group of $configfile
#
# @param mode
#  mode of $configfile
#
# @example
#   include doas
class doas (
  String $configfile = '/etc/doas.conf',
  Hash   $entries    = {},
  String $owner      = 'root',
  String $group      = 'wheel',
  String $mode       = '0555',
) {
  concat { $configfile:
    owner        => $owner,
    group        => $group,
    mode         => $mode,
    validate_cmd => '/usr/bin/doas -C %',
  }

  concat::fragment { 'doas header':
    target  => $configfile,
    content => '# configured with puppet',
    order   => '00',
  }

  $entry_defaults = {
    target => $configfile,
  }

  create_resources('doas::entry', $entries, $entry_defaults)
}
