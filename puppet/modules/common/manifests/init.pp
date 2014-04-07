class common {
  exec { 'yum_update':
    command => 'yum -y update',
    path => ['/bin', '/usr/bin']
  }
}