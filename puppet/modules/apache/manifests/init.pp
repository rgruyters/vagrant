class apache (
  $apache_listen = hiera('apache_listen'),
  ) {

  package { "httpd":
    ensure => present,
  }

  service { "httpd":
    ensure => running,
    require => Package["httpd"],
  }

  file {'/etc/httpd/conf/httpd.conf':
    ensure     => file,
    content => template("apache/httpd.conf.erb"),
    require    => Package["httpd"],
  }

}
