define system::sshuserkey (
    $gid             = $title,
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

        # Remove newlines and spaces from an OpenSSH formatted public key.
        $ssh_public_key_pattern = '^ssh-(\S+)\s(.+)\s(\S+)$'
        $ssh_key_type = chomp(
            regsubst($ssh_public_key, $ssh_public_key_pattern, '\1', 'M'))
        $ssh_public_key_value = chomp(
            regsubst($ssh_public_key, $ssh_public_key_pattern, '\2', 'M'))
        $ssh_public_key_id =
            regsubst($ssh_public_key, $ssh_public_key_pattern, '\3', 'M')
        $ssh_public_key_value_no_spaces =
            regsubst($ssh_public_key_value, '\s', '', 'GM')
        $_ssh_public_key =
            "ssh-${ssh_key_type} ${ssh_public_key_value_no_spaces} ${ssh_public_key_id}"

        file { "${ssh_dir}/id_${ssh_key_type}.pub":
            ensure  => file,
            owner   => $name,
            group   => $gid,
            mode    => '0644',
            content => $_ssh_public_key,
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
    } else {
        notify { "Both ssh_public_key and ssh_private_key need to be
                  defined for user ${name}":}
    }
}
