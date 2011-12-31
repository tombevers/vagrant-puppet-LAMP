class couchdb {

  package {"couchdb":
    ensure => present,
  }

  service {"couchdb":
    ensure    => running,
    hasstatus => true,
    enable    => true,
    require   => Package["couchdb"],
  }
}