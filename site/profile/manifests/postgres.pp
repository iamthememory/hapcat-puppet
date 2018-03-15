class profile::postgres {

  $dbrootpw = secret('postgres-root', {
    bytes  => 64,
    method => 'y64',
  })

  file { '/TEST' :
    ensure => 'file',
    source => $dbrootpw,
  }

  class { '::postgresql::server':
    postgres_password => 'TEMP',
    data_checksums    => true,
    encoding          => 'UTF-8',
    locale            => 'en_US.UTF-8',
  }

}
