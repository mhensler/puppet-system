class system::ssh_authorized_keys () {
  $hiera_config = hiera_hash('system::ssh_authorized_keys', undef)
  if $hiera_config {
    create_resources('ssh_authorized_key', $hiera_config)
  }
}
