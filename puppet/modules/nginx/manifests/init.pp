class nginx {
  yumrepo { 'nginx':
    descr    => 'nginx repo',
    baseurl  => 'http://nginx.org/packages/centos/6/i386/',
    gpgcheck => 0,
    enabled  => 1
  }

  package {
    "nginx":
      ensure  => present,
      require => Yumrepo['nginx']
  }

  service {
    "nginx":
      enable  => true,
      ensure  => running,
      require => Package['nginx'],
  }
}
