$source = "https://github.com/stackforge/puppet-openstack"

include clonerepo::do
include mypackages
include other_repo_sed
include intel-proxy::apt
include intel-proxy::git

class mypackages {
require intel-proxy::apt
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
	require => Class["mypackages","intel-proxy::git"],
	}
}



exec { "/usr/bin/rake modules:clone":
        environment => "http_proxy=http://proxy-us.intel.com:911",
	cwd => "/etc/puppet/modules/openstack",
	group	=> "root",
	user 	=> "root",
	logoutput 	=> on_failure,
	timeout	=> 0,
	require	=> Class["clonerepo::do","other_repo_sed"],
	}

