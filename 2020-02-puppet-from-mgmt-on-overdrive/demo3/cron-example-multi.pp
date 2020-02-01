
[0,5,10,15,20,25,30,35,40,45,50,55].each |$minute| {

  $previous = $minute ? { 0 => undef, default => $minute-5 }

  cron { "check in ($minute)":
    command => "curl https://my.apisrv.org/i/heartbeat#$hostname",
    minute  => $minute,
    before  => $previous ? {
      undef   => undef,
      default => Cron["check in ($previous)"],
    },
  }
}
