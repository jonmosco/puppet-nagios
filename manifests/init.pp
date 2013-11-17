# == Class: nagios
#
#    Puppet module for Nagios Monitoring
#
class nagios (
  $nrpe_client = false,
) inherits nagios::params {
}
