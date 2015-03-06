class system::sshd (
  $config   = undef,
  $sync_host_keys = true
) {
  if $config {
    include augeasproviders
    create_resources(sshd_config, $config)
  }
  else {
    $hiera_config = hiera_hash('system::sshd', undef)
    if $hiera_config {
      include augeasproviders
      create_resources(sshd_config, $hiera_config)
    }
  }
  if $sync_host_keys {
    # From: http://docs.puppetlabs.com/guides/exported_resources.html
    # and https://wiki.xkyle.com/Managing_SSH_Keys_With_Puppet

    # export host key
    $host_aliases = [ $::ipaddress, $::hostname]
    @@sshkey { $::fqdn:
      ensure       => present,
      host_aliases => $host_aliases,
      type         => 'rsa',
      key          => $::sshrsakey,
    }

    # import all other host keys
    Sshkey <<| |>>
  }
}
