class apache {
  package { "apache2":
    ensure => present,
  }
  
  # starts the apache2 service once the packages installed, and monitors changes
  # to its configuration files and reloads if necessary
  service { "apache2":
    ensure => running,
    enable => true,
    require => Package['apache2'],
    subscribe => [
      File["/etc/apache2/mods-enabled/rewrite.load"],
      File["/etc/apache2/sites-available/default"],
      File["/etc/apache2/conf.d/phpmyadmin.conf"]
    ],
  }

  # ensures that mod_rewrite is loaded and modifies the default configuration file
  file { "/etc/apache2/mods-enabled/rewrite.load":
    ensure => link,
    target => "/etc/apache2/mods-available/rewrite.load",
    require => Package['apache2'],
  }

  file { "/etc/apache2/sites-available/default":
    ensure => present,
    source => "/vagrant/manifests/default",
    require => Package['apache2'],
  }

  exec { 'echo "ServerName localhost" | sudo tee /etc/apache2/conf.d/fqdn':
    require => Package['apache2'],
  }
}