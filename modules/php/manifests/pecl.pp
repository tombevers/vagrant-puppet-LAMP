class php::pecl {
  include php
  # Install xdebug via PECL
  exec { "pecl install xdebug":
    require => [Package['php-pear', 'php5-dev'], Exec['pear upgrade']]
  }
}