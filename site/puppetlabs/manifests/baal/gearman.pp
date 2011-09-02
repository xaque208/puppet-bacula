class puppetlabs::baal::gearman {

  $packages = [
    "autoconf",
    "automake",
    "make",
    "gcc",
    "g++",
    "wget",
    "tar",
    "file",
    "netcat",
    "uuid-dev",
    "libltdl-dev",
    "libncurses5-dev",
    "libevent-dev"
  ]

  package { $packages: ensure => installed; }

  file { "/etc/ld.so.conf.d/opt_lib.conf":
    content  => "/opt/lib",
    replace  => false,
    notify   => Exec["ldconfig"],
  }

  exec { "ldconfig":
    command     => "/sbin/ldconfig",
    user        => root,
    refreshonly => true,
  }

}

