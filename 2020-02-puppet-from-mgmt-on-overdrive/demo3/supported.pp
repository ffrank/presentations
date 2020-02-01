
package { "haproxy":
  ensure => "installed",
}
->
file { "/etc/haproxy/haproxy.conf":
  mode => "0640",
}
->
service { "haproxy":
  enable => true,
}
