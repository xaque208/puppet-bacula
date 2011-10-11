node faro {
  include role::base

  # DNS resolution to internal hosts
  class {
    "unbound":
      interface => ["::0","0.0.0.0"],
      access    => ["192.168.100.0/24"],
  }

  unbound::stub { "puppetlabs.lan":
    address  => '192.168.100.1',
    insecure => true,
  }

}
