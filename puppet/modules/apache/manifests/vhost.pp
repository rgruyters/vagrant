define apache::vhost(
  $vhost_docroot = false,
  $vhost_name    = false,
  $vhost_options = ['Indexes','FollowSymLinks','MultiViews'],
  ) {

  file {
    "/etc/httpd/conf.d/${vhost_name}":
      content => template("apache/vhost-default.conf.erb"),
      owner   => 'root',
      group   => 'root',
      mode    => '755',
      require => Package['httpd'],
      notify  => Service['httpd'];
   }
}
