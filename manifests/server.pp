# == Class:: nagios::server
#
class nagios::server inherits nagios {

  package { 'nagios':
    ensure => installed,
  }
  package { 'nagios-plugins':
    ensure => installed,
  }
  file { '/etc/nagios/conf.d':
    ensure => directory,
    owner  => 'nagios',
  }
  service { 'nagios':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    require    => Package['nagios'],
  }

  # collect resources and populate /etc/nagios/nagios_*.cfg
  Nagios_host    <<||>> {
  notify   => Service['nagios']
  }
  Nagios_service <<||>> {
  notify => Service['nagios']
  }

}
