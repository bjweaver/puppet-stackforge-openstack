class intelproxy{
file { "/etc/apt/apt.conf":
	mode => 440,
	owner => root,
	group => root,
	source => "puppet:///modules/intelproxy/apt.conf"
	}
}
