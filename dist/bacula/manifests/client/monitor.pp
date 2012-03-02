class bacula::client::monitor {
  include bacula::params
  include nagios::params

  @@nagios_service { "check_baculafd_${hostname}":
    use                 => 'generic-service',
    host_name           => "$fqdn",
    check_command       => 'check_nrpe!check_proc!1:1 bacula-fd',
    service_description => "check_baculafd_${hostname}",
    target              => '/etc/nagios3/conf.d/nagios_service.cfg',
    notify              => Service[$nagios::params::nagios_service],
    require             => Service[$bacula::params::bacula_client_services],
  }

}