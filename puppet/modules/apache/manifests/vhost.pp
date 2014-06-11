define apache::vhost(
  $vhost_docroot = false,
  $vhost_name    = false,
  $vhost_options = ['Indexes','FollowSymLinks','MultiViews', 'All'],
) {

  file {"/etc/httpd/conf.d/vhosts/${vhost_name}.conf":
      ensure => present,
      content => template("apache/vhost-default.conf.erb"),
      owner   => 'root',
      group   => 'root',
      mode    => "0644",
      require => Package['httpd'],
      notify  => Service['httpd'];
  }
}
