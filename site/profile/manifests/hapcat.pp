class profile::hapcat {
  class { '::hapcat':
    package_pip_url          => 'git+https://github.com/iamthememory/hapcat-backend.git@5042ce28e162304f04a015b81467e63d4444a489',
    package_pip_install_args => '--upgrade',
    package_ensure           => 'latest',
  }
}
