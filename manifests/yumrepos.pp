# == Class: system::yumrepos
#
# Manage yum repository files under /etc/yum.repos.d.
#
# === Parameters
#
# [*system::yumrepos::defaults*]
# None.
#
# === Variables
#
# [*system::yumrepos::files*]
#   Hash of hashes defining files that should be created in the same stage
#   as the yumrepos. This can be used to install certificates needed to
#   access the yum repositories. This is necessary because system::files
#   is executed after the yum repositories are first used.
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

  $yumrepos_files = hiera_hash('system::yumrepos::files', undef)
  if $yumrepos_files {
    create_resources(file, $yumrepos_files, {
      ensure => present,
    })
  }

  $yumrepos_defaults = hiera_hash('system::yumrepos::defaults', {
    enabled  => '1',
    gpgcheck => '1',
  })

  $yumrepos = hiera_hash('system::yumrepos', undef)
  if $yumrepos {
    create_resources(yumrepo, $yumrepos, $yumrepos_defaults)
  }

}
