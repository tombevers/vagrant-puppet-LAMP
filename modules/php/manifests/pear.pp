class php::pear {
  include php
  # upgrades PEAR, installs Codesniffer and PHPUnit
  exec { "pear upgrade":
    require => Package['php-pear']
  }
  #exec { "pear install PHP_Codesniffer":
  #  require => [Package['php-pear'], Exec['pear upgrade']]
  #}
  #exec { "pear channel-discover pear.phing.info":
  #  require => [Package['php-pear'], Exec['pear upgrade']]  
  #}
  #exec { "pear install phing/phing":
  #  require => [Package['php-pear'], Exec['pear channel-discover pear.phing.info'], Exec['pear upgrade']]
  #}
  #exec { "pear channel-discover pear.phpmd.org":
  #  require => [Package['php-pear'], Exec['pear upgrade']]  
  #}
  #exec { "pear channel-discover pear.pdepend.org":
  #  require => [Package['php-pear'], Exec['pear upgrade']]  
  #}
  #exec { "pear install --alldeps phpmd/PHP_PMD":
  #  require => [Package['php-pear'], Exec['pear channel-discover pear.phpmd.org'], Exec['pear channel-discover pear.pdepend.org'], Exec['pear upgrade']]
  #}
  #exec { "pear install pdepend/PHP_Depend-beta":
  #  require => [Package['php-pear'], Exec['pear channel-discover pear.pdepend.org'], Exec['pear upgrade']]
  #}
  #exec { "pear config-set auto_discover 1":
  #  require => [Package['php-pear'], Exec['pear upgrade']]
  #}
  #exec { "pear install pear.phpunit.de/PHPUnit":
  #  require => [Package['php-pear'], Exec['pear config-set auto_discover 1'], Exec['pear upgrade']]
  #}
  #exec { "pear install phpunit/phploc":
  #  require => [Package['php-pear'], Exec['pear config-set auto_discover 1'], Exec['pear upgrade']]
  #}
  #exec { "pear install phpunit/phpcpd":
  #  require => [Package['php-pear'], Exec['pear config-set auto_discover 1'], Exec['pear upgrade']]
  #}
}