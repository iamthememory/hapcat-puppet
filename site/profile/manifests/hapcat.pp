class profile::hapcat {
  class { '::hapcat':
    package_pip_url          => 'git+https://github.com/iamthememory/hapcat-backend.git',
  }
}
