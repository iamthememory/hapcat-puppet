class profile::hapcat {
  class { '::hapcat':
    package_pip_url          => 'git+https://github.com/iamthememory/hapcat-backend.git@eeeb36662fc25c4238252b024f2a2871a442ad11',
    package_pip_install_args => '--upgrade',
    package_ensure           => 'latest',
  }
}
