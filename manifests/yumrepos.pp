# == Class: system::yumrepos
#
# Manage yum repository files under /etc/yum.repos.d.
#
# === Parameters
#
# None.
#
# === Variables
#
# [*system::yumrepos::defaults*]
#   Hash containing the default values that are used for all yumrepos that
#   are created through this class. If the value is not set then the defaults
#   are:
#
#     {
#       enabled  => '1',
#       gpgcheck => '1',
#     }
#
# [*system::yumrepos*]
#   Hash of hashes containing yumrepo definitions. See the Puppet yumrepo
#   resource type for a definition of the parameters that can be used.
#
# === Examples
#
# Below is an example of configuring a single yum repository through
# a Hiera YAML file.
#
#   system::yumrepos:
#     'rhel-x86_64-server-6':
#       baseurl:  'http://path/to/repo'
#       descr:    'RHEL 6 x86_64 Update Channel'
#       enabled:  '1'
#       gpgcheck: '1'
#       gpgkey:   'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release'
#
class system::yumrepos () {

  $defaults = hiera_hash('system::yumrepos::defaults', {
    enabled  => '1',
    gpgcheck => '1',
  })

  $hiera_config = hiera_hash('system::yumrepos', undef)
  if $hiera_config {
    create_resources(yumrepo, $hiera_config, $defaults)
  }

}
