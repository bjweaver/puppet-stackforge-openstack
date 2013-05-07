class intel-proxy{
file { "/etc/apt/apt.conf":
	mode => 440,
	owner => root,
	group => root,
	source => "puppet:///modules/intel-proxy/apt.conf"
	}
}
