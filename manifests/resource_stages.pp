# == Class: system::resource_stages
#
# This class controls which stage each resource type is executed in.
# Normally users will not need to modify the run stages and can rely
# on the defaults. But if a user runs into a special case and needs
# to modify the run stage of a resource it can be done through a
# parameter to this class.
#
# === Parameters
#
# === Authors
#
# Andrew Kroh <andy@crowbird.com>
#
class system::resource_stages (
  $augeas             = main,
  $crontabs           = main,
  $dns                = first,
  $execs              = last,
  $files              = third,
  $groups             = first,
  $groups_realize     = first,
  $hosts              = main,
  $limits             = main,
  $mail               = main,
  $mounts             = last,
  $network_global     = first,
  $network_interfaces = first,
  $network_route      = first,
  $packages           = second,
  $providers          = first,
  $resources          = third,
  $schedules          = first,
  $selbooleans        = first,
  $services           = main,
  $ssh_user_keys      = first,
  $sysconfig          = main,
  $sysctl             = main,
  $templates          = last,
  $users              = first,
  $users_realize      = first,
  $yumgroups          = second,
  $yumrepos           = first,
) {

  $valid_stages = ['^first$', '^second$', '^third$', '^main$', '^last$']

  validate_re($augeas, $valid_stages)
  validate_re($crontabs, $valid_stages)
  validate_re($dns, $valid_stages)
  validate_re($execs, $valid_stages)
  validate_re($files, $valid_stages)
  validate_re($groups, $valid_stages)
  validate_re($groups_realize, $valid_stages)
  validate_re($hosts, $valid_stages)
  validate_re($limits, $valid_stages)
  validate_re($mail, $valid_stages)
  validate_re($mounts, $valid_stages)
  validate_re($network_global, $valid_stages)
  validate_re($network_interfaces, $valid_stages)
  validate_re($network_route, $valid_stages)
  validate_re($packages, $valid_stages)
  validate_re($providers, $valid_stages)
  validate_re($resources, $valid_stages)
  validate_re($schedules, $valid_stages)
  validate_re($selbooleans, $valid_stages)
  validate_re($services, $valid_stages)
  validate_re($ssh_user_keys, $valid_stages)
  validate_re($sysconfig, $valid_stages)
  validate_re($sysctl, $valid_stages)
  validate_re($templates, $valid_stages)
  validate_re($users, $valid_stages)
  validate_re($users_realize, $valid_stages)
  validate_re($yumgroups, $valid_stages)
  validate_re($yumrepos, $valid_stages)

}
