
node "dev-app01-ffrank.localdomain" {
	file { "/tmp/puppet-managed-file":
		ensure => "file",
		content => "please don't change too often\n",
	}
}
