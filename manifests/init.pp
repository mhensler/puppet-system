class system () {

  include system::stages
  include system::resource_stages

  class { 'system::augeas':
    stage => $system::resource_stages::augeas,
  }

  class { 'system::crontabs':
    stage => $system::resource_stages::crontabs,
  }

  class { 'system::network::dns':
    stage => $system::resource_stages::dns,
  }

  class { 'system::execs':
    stage => $system::resource_stages::execs,
  }

  class { 'system::files':
    stage => $system::resource_stages::files,
  }

  class { 'system::groups':
    stage => $system::resource_stages::groups,
  }

  class { 'system::groups::realize':
    stage   => $system::resource_stages::groups_realize,
    require => Class['system::groups'],
  }

  class { 'system::hosts':
    stage => $system::resource_stages::hosts,
  }

  class { 'system::limits':
    stage => $system::resource_stages::limits,
  }

  class { 'system::mail':
    stage => $system::resource_stages::mail,
  }

  class { 'system::mounts':
    stage => $system::resource_stages::mounts,
  }

  class { 'system::network::global':
    stage => $system::resource_stages::network_global,
  }

  class { 'system::network::interfaces':
    stage => $system::resource_stages::network_interfaces,
  }

  class { 'system::network::route':
    stage   => $system::resource_stages::network_route,
    require => Class['::system::network::interfaces'],
  }

  class { 'system::packages':
    stage   => $system::resource_stages::packages,
    require => Class['system::yumgroups'],
  }

  class { 'system::providers':
    stage => $system::resource_stages::providers,
  }

  class { 'system::resources':
    stage => $system::resource_stages::resources,
  }

  class { 'system::schedules':
    stage => $system::resource_stages::schedules,
  }

  class { 'system::selbooleans':
    stage => $system::resource_stages::selbooleans,
  }

  class { 'system::services':
    stage => $system::resource_stages::services,
  }

  class { 'system::ssh_user_keys':
    stage   => $system::resource_stages::ssh_user_keys,
    require => [Class['system::users'], Class['system::groups']],
  }

  class { 'system::sysconfig':
    stage => $system::resource_stages::sysconfig,
  }

  class { 'system::sysctl':
    stage => $system::resource_stages::sysctl,
  }

  class { 'system::templates':
    stage => $system::resource_stages::templates,
  }

  class { 'system::users':
    stage   => $system::resource_stages::users,
    require => Class['system::groups'],
  }

  class { 'system::users::realize':
    stage   => $system::resource_stages::users_realize,
    require => Class['system::users', 'system::groups::realize'],
  }

  class { 'system::yumgroups':
    stage => $system::resource_stages::yumgroups,
  }

  class { 'system::yumrepos':
    stage   => $system::resource_stages::yumrepos,
    require => Class['system::schedules'],
  }

}
