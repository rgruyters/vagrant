class apache (
  $apache_listen = hiera('apache_listen'),
  $server_name   = hiera('server_name'),
) {

  package { "httpd":
    ensure => present,
  }

  service { "httpd":
    ensure => running,
    require => Package["httpd"],
  }

  file {'/etc/httpd/conf.d/vhosts.conf':
    ensure  => file,
    content => template("apache/vhosts.conf.erb"),
    require => Package["httpd"],
  }

  file {'/etc/httpd/conf/httpd.conf':
    ensure  => file,
    content => template("apache/httpd.conf.erb"),
    require => Package["httpd"],
  }

  file {'/etc/httpd/conf.d/vhosts':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => "0755"
  }
}
