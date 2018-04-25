class profile::hapcat {
  class { '::hapcat':
    package_pip_url          => 'git+https://github.com/iamthememory/hapcat-backend.git',
  }

  class { '::nginx':
    manage_repo    => true,
    package_source => 'nginx-mainline',
  }
}
