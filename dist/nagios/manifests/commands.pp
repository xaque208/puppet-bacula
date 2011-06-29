# Class: nagios::commands
#
# This class configures the Nagios commands
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class nagios::commands {

  file { '/etc/nagios/conf.d/nagios_commands.cfg':
    mode => 0644,
    before => Service[$nagios::params::nagios_service],
  }

  nagios_command { 'check_bacula':
    command_line => "/usr/lib/nagios/plugins/check_bacula.pl -H 24 -w 1 -c 1 -j '\$HOSTALIAS\$'",
    command_name => 'check_bacula',
    ensure => present,
    target => '/etc/nagios/conf.d/nagios_commands.cfg',
    notify => Service[$nagios::params::nagios_service],
  }

  nagios_command { 'check_http_site':
    command_line => "/usr/lib/nagios/plugins/check_http -H '\$ARG1\$' -I '\$HOSTADDRESS\$'",
    command_name => 'check_http_site',
    ensure => present,
    target => '/etc/nagios/conf.d/nagios_commands.cfg',
    notify => Service[$nagios::params::nagios_service],
  }

  nagios_command { 'check_http_site_auth':
    command_line => "/usr/lib/nagios/plugins/check_http -H '\$ARG1\$' -I '\$HOSTADDRESS\$' -a '\$ARG2\$'",
    command_name => 'check_http_site_auth',
    ensure => present,
    target => '/etc/nagios/conf.d/nagios_commands.cfg',
    notify => Service[$nagios::params::nagios_service],
  }

}
