class other_repo_sed {
require clonerepo::do

exec { '/bin/sed -i s/git\:/http\:/ /etc/puppet/modules/openstack/other_repos.yaml':
	cwd => "/tmp",
	group => "root",
	user => "root",
	logoutput => on_failure,
	timeout => 20,
}
}
