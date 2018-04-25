class profile::hapcat {
  class { '::hapcat':
    package_pip_url => 'git+https://github.com/iamthememory/hapcat-backend.git',
    service_group   => 'www-data'
  }

  class { '::nginx':
    manage_repo    => true,
    package_source => 'nginx-mainline',
  }

  file { '/var/hapcatweb':
    ensure => 'directory',
    owner  => 'www-data',
    group  => 'www-data',
    mode   => '0750',
  }
}
