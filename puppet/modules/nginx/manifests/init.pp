class nginx {
  package {
    "nginx":
      ensure => present
  }

  service {
    "nginx":
      enable => true,
      ensure => running,
      require => Package['nginx'],
  }
}