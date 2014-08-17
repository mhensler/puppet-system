class system::network::dns (
  $nameserver = [],
  $domain     = '',
  $search     = [],
  $sortlist   = [],
  $options    = [],
) {

  if $nameserver and !empty($nameserver) {

    validate_array($nameserver)
    validate_string($domain)
    validate_array($search)
    validate_array($sortlist)
    validate_array($options)

    if ! empty($domain) and ! empty($search) {
      fail('The "domain" and "search" parameters are mutually exclusive.')
    }

    file { '/etc/resolv.conf':
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template('system/resolv.conf.erb'),
    }
  }

}
