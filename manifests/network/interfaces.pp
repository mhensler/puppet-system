# == Class: system::network::interfaces
#
# Manages network interfaces. This class acts bridge between Hiera and
# the network module. It reads the configuration from Hiera and creates
# the resources defined in the configuration.
#
# === Variables
#
# [*system::network::if::static*]
#   Hash of hashes defining resources that will be created using
#   ::network::if::static.
#
# [*system::network::if::dynamic*]
#   Hash of hashes defining resources that will be created using
#   ::network::if::dynamic.
#
# [*system::network::if::bridge*]
#   Hash of hashes defining resources that will be created using
#   ::network::if::bridge.
#
# [*system::network::alias*]
#   Hash of hashes defining resources that will be created using
#   ::network::alias.
#
# [*system::network::alias::range*]
#   Hash of hashes defining resources that will be created using
#   ::network::alias::range.
#
# [*system::network::bond::static*]
#   Hash of hashes defining resources that will be created using
#   ::network::bond::static.
#
# [*system::network::bond::dynamic*]
#   Hash of hashes defining resources that will be created using
#   ::network::bond::dynamic.
#
# [*system::network::bond::slave*]
#   Hash of hashes defining resources that will be created using
#   ::network::bond::slave.
#
# [*system::network::bridge::static*]
#   Hash of hashes defining resources that will be created using
#   ::network::bridge::static.
#
# [*system::network::bridge::dynamic*]
#   Hash of hashes defining resources that will be created using
#   ::network::bridge::dynamic.
class system::network::interfaces () {

  $static = hiera_hash('system::network::if::static', undef)
  if ($static) {
    create_resources('network::if::static', $static)
  }

  $dynamic = hiera_hash('system::network::if::dynamic', undef)
  if ($dynamic) {
    create_resources('network::if::dynamic', $dynamic)
  }

  $bridge = hiera_hash('system::network::if::bridge', undef)
  if ($bridge) {
    create_resources('network::if::bridge', $bridge)
  }

  $alias = hiera_hash('system::network::alias', undef)
  if ($alias) {
    create_resources('network::alias', $alias)
  }

  $alias_range = hiera_hash('system::network::alias::range', undef)
  if ($alias_range) {
    create_resources('network::alias::range', $alias_range)
  }

  $bond_static = hiera_hash('system::network::bond::static', undef)
  if ($bond_static) {
    create_resources('network::bond::static', $bond_static)
  }

  $bond_dynamic = hiera_hash('system::network::bond::dynamic', undef)
  if ($bond_dynamic) {
    create_resources('network::bond::dynamic', $bond_dynamic)
  }

  $bond_bridge = hiera_hash('system::network::bond::bridge', undef)
  if ($bond_bridge) {
    create_resources('network::bond::bridge', $bond_bridge)
  }

  $bond_slave = hiera_hash('system::network::bond::slave', undef)
  if ($bond_slave) {
    create_resources('network::bond::slave', $bond_slave)
  }

  $bridge_static = hiera_hash('system::network::bridge::static', undef)
  if ($bridge_static) {
    create_resources('network::bridge::static', $bridge_static)
  }

  $bridge_dynamic = hiera_hash('system::network::bridge::dynamic', undef)
  if ($bridge_dynamic) {
    create_resources('network::bridge::dynamic', $bridge_dynamic)
  }

}
