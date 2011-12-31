class php::pecl {
  include php
  # Install xdebug via PECL
  exec { "pecl install xdebug":
    unless => 'pecl list | grep "xdebug"',
    require => [Package['php-pear', 'php5-dev'], Exec['pear upgrade']],
  }
}