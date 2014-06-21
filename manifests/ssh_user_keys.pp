class system::ssh_user_keys (
    $config = undef,
) {
    if ($config) {
        create_resources(sshuserkey, $config)
    }
    else
    {
        $hiera_config = hiera_hash('system::ssh_user_keys', undef)
        if ($hiera_config) {
            create_resources(sshuserkey, $hiera_config)
        }
    }
}
