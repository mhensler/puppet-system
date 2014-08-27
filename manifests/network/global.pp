# == Class: system::network::global
#
# Manages /etc/sysconfig/network.
#
# === Parameters
#
# [*hostname*]
#   Fully qualified hostname of the machine. Optional. This class will not
#   modify any configuration if this parameter is undefined or empty.
#
# [*gateway*]
#   IP address of the default gateway. Optional.
#
# [*gatewaydev*]
#   Determines the device to use to access the default gateway. Optional.
#
# [*nisdomain*]
#   NIS domain. Optional.
#
# [*nozeroconf*]
#   Determines if the zeroconf route (169.254.0.0/16) should be disabled.
#   Optional. Setting this to any value other than empty causes the zeroconf
#   route to be disabled.
class system::network::global (
  $hostname   = undef,
  $gateway    = '',
  $gatewaydev = '',
  $nisdomain  = '',
  $nozeroconf = '',
) {
  if $hostname and !empty($hostname) {
    class { '::network::global':
      hostname   => $hostname,
      gateway    => $gateway,
      gatewaydev => $gatewaydev,
      nisdomain  => $nisdomain,
      nozeroconf => $nozeroconf,
    }
  }
}
