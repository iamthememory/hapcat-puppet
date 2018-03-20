class profile::r10k {
  cron { 'r10k-update':
    ensure  => 'present',
    command => '/opt/puppetlabs/bin/r10k deploy environment -pv',
    user    => 'root',
    minute  => [0, 10, 20, 30, 40, 50],
  }
}
