
cron { "check in":
  command => "curl https://my.apisrv.org/i/heartbeat#$hostname",
  minute  => 10,
}
