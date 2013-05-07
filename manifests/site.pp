$source = "https://github.com/stackforge/puppet-openstack"

include clonerepo::do

class mypackages {
require intelproxy
package { 'git':
	ensure	=> 'present',
	}

package { 'rake':
	ensure	=> 'present',
	}
}	

class clonerepo::do {
vcsrepo { "/etc/puppet/modules/openstack":
	ensure => present,
	provider => git,
	source => $source,
	user => 'root',
	require => Class["mypackages"],
	}
}



exec { "/usr/bin/rake modules:clone":
	cwd => "/etc/puppet/modules/openstack",
	group	=> "root",
	user 	=> "root",
	logoutput 	=> on_failure,
	timeout	=> 0,
	require	=> Class["clonerepo::do"],
	}

