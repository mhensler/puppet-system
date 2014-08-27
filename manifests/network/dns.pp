# == Class: system::network::dns
#
# Manages DNS configuration. This class manages the contents of the
# /etc/resolv.conf file.
#
# === Parameters
#
# [*nameservers*]
#   Array of nameserver IP addresses. This class will not modify any
#   configuration if this parameter is undefined or empty.
#
# [*domain*]
#   Local domain name. Optional. This parameter cannot be used with
#   search.
#
# [*search*]
#   Array of search domains to use of for hostname lookup. Optional.
#   This parameter cannot be used with domain.
#
# [*sortlist*]
#   Array of IP address-netmask pairs to use in sorting results from
#   the resolver. Optional.
#
# [*options*]
#   Array of options to pass to the resolver. Optional.
class system::network::dns (
  $nameservers = [],
  $domain      = '',
  $search      = [],
  $sortlist    = [],
  $options     = [],
) {

  if $nameservers and !empty($nameservers) {

    validate_array($nameservers)
    validate_string($domain)
    validate_array($search)
    validate_array($sortlist)
    validate_array($options)

    if !empty($domain) and !empty($search) {
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
