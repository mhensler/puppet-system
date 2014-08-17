class system::network::global (
  $hostname   = undef,
  $gateway    = '',
  $gatewaydev = '',
  $nisdomain  = '',
  $vlan       = '',
  $nozeroconf = '',
) {
  if $hostname and !empty($hostname) {
    class { '::network::global':
      hostname   => $hostname,
      gateway    => $gateway,
      gatewaydev => $gatewaydev,
      nisdomain  => $nisdomain,
      vlan       => $vlan,
      nozeroconf => $nozeroconf,
    }
  }
}
