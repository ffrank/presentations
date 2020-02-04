
package { "haproxy":
  ensure => "installed",
}
->
file { "/etc/haproxy/haproxy.cfg":
  mode => "0640",
}
->
service { "haproxy":
  enable => true,
}
