class bootstrap {
  # this makes puppet and vagrant shut up about the puppet group
  group { "puppet": 
    ensure => "present", 
  }

  # Set FQDN for virtualbox
  if $virtual == "virtualbox" and $fqdn == '' {
    $fqdn = "localhost"
  }

  # make sure the packages are up to date before beginning
  exec { "apt-get update":
    command => "apt-get update",
  }

  # because puppet command are not run sequentially, ensure that packages are
  # up to date before installing before installing packages, services, files, etc.
  Package { require => Exec["apt-get update"] }
  File { require => Exec["apt-get update"] }
}