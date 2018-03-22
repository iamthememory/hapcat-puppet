class profile::hapcat {
  class { '::hapcat':
    package_pip_url          => 'git+https://github.com/iamthememory/hapcat-backend.git'
    package_pip_install_args => '--upgrade --force-reinstall --ignore-installed',
  }
}
