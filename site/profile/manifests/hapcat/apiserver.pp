class profile::hapcat::apiserver (
) {

  class { 'python' :
    pip    => 'present',
    ensure => 'present',
  }

  python::pip { 'hapcat' :
    pkgname => 'hapcat',
    url     => 'git+https://github.com/iamthememory/hapcat-backend.git',
    ensure  => 'latest',
  }

  file { '/lib/systemd/system/hapcat-apiserver.service':
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => template('hapcat-apiserver.service.erb'),
    notify  => [
      Exec['hapcat-apiserver-systemd-reload'],
    ],
  }

  exec { 'hapcat-apiserver-systemd-reload':
    command     => 'systemctl daemon-reload',
    path        => [ '/usr/bin', '/bin', '/usr/sbin', '/sbin' ],
    refreshonly => true,
    notify      => [
      Exec['hapcat-apiserver'],
    ],
  }

  service { 'hapcat-apiserver':
    ensure   => running,
    enable   => true,
    provider => 'systemd',
  }
}
