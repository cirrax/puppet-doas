# @summary Create an entry in the doas configfile
#
# @param order
#  order to append
# @param action
#   The action to be taken if this rule matches
# @param options
#   Array of options
# @param identity
#   The username to match.
# @param as_target
#   The target user the running user is allowed to run the
#   command as.
# @param command
# @param target
#  target to  append the configuration
#
define doas::entry (
  String                $target,
  String                $identity,
  String                $as_target,
  String                $command,
  String                $order   = $title,
  Enum['permit','deny'] $action  = 'permit',
  Array                 $options = [],
  Array                 $setenvs = [],
  Array                 $args    = [],
) {

  concat::fragment{"doas entry: ${title}":
    target  => $target,
    content => template('doas/doas.conf.erb'),
    order   => $order,
  }
}
