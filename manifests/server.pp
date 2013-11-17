# == Class:: nagios::server
#
class nagios::server inherits nagios {

  package { 'nagios':
    ensure => installed,
  }
  package { 'nagios-plugins':
    ensure => installed,
  }
  service { 'nagios':
    ensure     => running,
    enable     => true,
    hasrestart => true,
  }

}
