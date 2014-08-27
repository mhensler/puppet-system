# == Class: system::network::route
#
# Manages network routes. This class acts bridge between Hiera and
# the network module. It reads the configuration from Hiera and creates
# the resources defined in the configuration.
#
# === Variables
#
# [*system::network::route*]
#   Hash of hashes defining resources that will be created using
#   ::network::if::route.
class system::network::route () {

  $route = hiera_hash('system::network::route', undef)
  if $route {
    create_resources('network::route', $route)
  }

}
