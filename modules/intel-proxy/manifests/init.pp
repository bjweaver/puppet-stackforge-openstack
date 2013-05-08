#require mypackages

class intel-proxy::apt {
file { "/etc/apt/apt.conf":
	mode => 440,
	owner => root,
	group => root,
	source => "puppet:///modules/intel-proxy/apt.conf"
	}
}

class intel-proxy::git {
require mypackages
exec { "/usr/bin/git config --global http.proxy http://proxy-us.intel.com:911":
   environment => "HOME=/root",
   cwd => "/root",
   group => "root",
   user  => "root",
   logoutput => on_failure,
   timeout => 20,
   }
}
