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

  $alias_range = hiera_hash('system::network::alias_range', undef)
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
