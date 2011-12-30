class other {
  $packages = ["htop", "curl", "tmux"]
  package { $packages:
    ensure => present,
  }
}