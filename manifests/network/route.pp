class system::network::route () {

  $route = hiera_hash('system::network::route', undef)
  if $route {
    create_resources('network::route', $route)
  }

}
