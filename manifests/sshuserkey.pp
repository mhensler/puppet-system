define system::sshuserkey (
    $gid             = $title,
    $ssh_key_type    = 'rsa',
    $home            = undef,
    $ssh_private_key = undef,
    $ssh_public_key  = undef,
) {
    if ($ssh_private_key and $ssh_public_key) {

        # Determine the user's home directory.
        if ($home) {
            $home_dir = $home
        } elsif ($name == 'root') {
            $home_dir = '/root'
        } else {
            $home_dir = "/home/${name}"
        }

        $ssh_dir = "${home_dir}/.ssh"

        file { $ssh_dir:
            ensure  => directory,
            owner   => $name,
            group   => $gid,
            mode    => '0700',
        }

        file { "${ssh_dir}/id_${ssh_key_type}.pub":
            ensure  => file,
            owner   => $name,
            group   => $gid,
            mode    => '0644',
            content => $ssh_public_key,
            require => File[$ssh_dir],
        }

        file { "${ssh_dir}/id_${ssh_key_type}":
            ensure  => file,
            owner   => $name,
            group   => $gid,
            mode    => '0600',
            content => $ssh_private_key,
            require => File[$ssh_dir],
        }

        # Autorequire the user if it is managed by Puppet.
        # NOTE: This will automatically realize the User
        #       if it is virtual.
        #File[$ssh_dir] -> User <| title == "$name" |>
    } else {
        notify { "Both ssh_public_key and ssh_private_key need to be 
                  defined for user ${name}":}
    }
}
