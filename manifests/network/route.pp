class system::network::route () {

  $route = hiera_hash('system::network::route', undef)
  if $routes {
    create_resources('network::route', $route)
  }

}
