class profile::postgres {

  $postgres_pw = hiera('postgres_pw')

  class { '::postgresql::server':
    postgres_password => $postgres_pw,
    data_checksums    => true,
    encoding          => 'UTF-8',
    locale            => 'en_US.UTF-8',
  }

}
