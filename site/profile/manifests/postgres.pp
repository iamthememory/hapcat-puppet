class profile::postgres {

  $postgres_pw = hiera('postgres_pw')

  notify {"Using postgres password ${postgrespw}":}

  class { '::postgresql::server':
    postgres_password => hiera('postgres_pw'),
    data_checksums    => true,
    encoding          => 'UTF-8',
    locale            => 'en_US.UTF-8',
  }

}
