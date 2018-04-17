class profile::postgres {

  $postgres_pw = hiera('postgres_pw')
  $hapcatdb = hiera('hapcatdb')
  $hapcatdbuser = hiera('hapcatdbuser')
  $hapcatdbpw = hiera('hapcatdbpw')

  class { '::postgresql::server':
    postgres_password => $postgres_pw,
    data_checksums    => true,
    encoding          => 'UTF-8',
    locale            => 'en_US.UTF-8',
  }

  postgresql::server::role { $hapcatdbuser :
    ensure          => 'present',
    password_hash   => postgresql_password($hapcatdbuser, $hapcatdbpw),
    update_password => true,
    username        => $hapcatdbuser,
  } ->
  postgresql::server::database { $hapcatdb :
    ensure  => 'present',
    comment => 'Hapcat database',
    owner    => $hapcatdbuser,
  }

}
