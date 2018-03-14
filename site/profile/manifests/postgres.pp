class profile::postgres {

  $dbrootpw = secret('postgres-root', {
    bytes  => 256,
    method => 'y64',
  })

  class { '::postgresql::server':
    postgres_password => file($dbrootpw),
    data_checksums    => true,
    encoding          => 'UTF-8',
    locale            => 'en_US.UTF-8',
  }

}
