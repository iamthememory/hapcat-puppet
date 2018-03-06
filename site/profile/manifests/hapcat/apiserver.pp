class profile::hapcat::apiserver (
) {

  class { 'python' :
    pip    => 'present',
    ensure => 'present',
  }

  python::pip { 'hapcat' :
    pkgname => 'hapcat',
    url     => 'git+https://github.com/iamthememory/hapcat-backend.git',
    ensure  => 'present',
  }
}
