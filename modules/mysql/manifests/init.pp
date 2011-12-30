class mysql {
  $mysqlPassword = "root"
 
  package { "mysql-server":
    ensure => present,
  }

  service { "mysql":
    enable => true,
    ensure => running,
    require => Package["mysql-server"],
  }

#  file { "/var/lib/mysql/my.cnf":
#    owner => "mysql", group => "mysql",
#    source => "puppet:///mysql/my.cnf",
#    notify => Service["mysqld"],
#    require => Package["mysql-server"],
#  }
 
#  file { "/etc/my.cnf":
#    require => File["/var/lib/mysql/my.cnf"],
#    ensure => "/var/lib/mysql/my.cnf",
#  }

  exec { "set-mysql-password":
    unless => "mysqladmin -uroot -p$mysqlPassword status",
    command => "mysqladmin -uroot password $mysqlPassword",
    require => Service["mysql"],
  }
}