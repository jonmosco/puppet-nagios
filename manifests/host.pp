# == Class:: nagios::host
#
#    This class contains the basic host monitoring:
#    check_ping
#    check_uptime
#
#    All host definitions will be stored in /etc/nagios/conf.d/
#
class nagios::host inherits nagios {
  @@nagios_host { $::fqdn:
    ensure  => present,
    alias   => $::hostname,
    address => $::ipaddress,
    use     => 'generic-host',
    target  => "/etc/nagios/conf.d/nagios_host_${::fqdn}.cfg",
  }

  @@nagios_service { "check_ping_${::hostname}":
    check_command       => 'check_ping!100.0,20%!500.0,60%',
    use                 => 'generic-service',
    host_name           => $::fqdn,
    notification_period => '24x7',
    service_description => "${::hostname}_check_ping"
  }
}
