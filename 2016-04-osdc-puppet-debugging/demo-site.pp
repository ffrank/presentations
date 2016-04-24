
node 'osdc-demo' {
  include many_users
}

define user_dotfile($user, $home="/home/mob/$user") {
  file { "$home/$name":
    ensure => 'file',
    owner => $user,
    group => $user,
  }
}

define user_with_key_and_stuff() {
  $dotfilenames = [
    ".puppetlog", ".bashrc", ".mobshrc", ".dotfile", ".test", ".conf", ".net", ".com", ".info", ".hidden", ".foobar",
  ]

  user { $name:
    ensure => present,
    home => "/home/mob/$name",
    shell => "/bin/mobsh",
  }
  file { "/home/mob/$name":
    ensure => "directory",
    owner => $name,
    group => $name,
    mode => '0640',
  }
  $my_dotfiles = regsubst($dotfilenames, "^", "/home/mob/$name")
  user_dotfile { $my_dotfiles:
    user => $name,
  }
  ssh_authorized_key { $name:
    ensure => present,
    type => 'rsa',
    user => $name,
    key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDTXvM7AslzjNUYrPLiNVBsF5VnqL2RmqrkzscdVdHzVxvieNwmLGeUkg8EfXPiz7j5F/Lr0J8oItTCWzyN2KmM+DhUMjvP4AbELO/VYbnVrZICRiUNYSO3EN9/uapKAuiev88d7ynbonCU0VZoTPg/ug4OondOrLCtcGri5ltF+mausGfAYiFAQVEWqXV+1tyejoawJ884etb3n4ilpsrH9JK6AtOkEWVD3TDrNi29O1mQQ/Cn88g472zAJ+DhsIn+iehtfX5nmOtDNN/1t1bGMIBzkSYEAYwUiRJbRXvbobT7qKZQPA3dh0m8AYQS5/hd4/c4pmlxL8kgr24SnBY5',
  }
}

class many_users {
  $users = [
    "adam", "adr", "aj", "al", "alf", "amos", "andreashochsteger", "andrew", "andy", "ann", "aussielunix", "bak",
    "battlesysadmin", "benj", "bernard", "bit", "bob", "brad", "bradley", "bran", "brian", "bryan", "cblu", "ch", "chad", "chems",
#    "chris", "cmc", "col_s", "csmithere", "cst", "csu,", "dave", "dds", "derekw", "dthacker", "ed", "emma", "erling", "esq",
#    "evan", "f", "fbeu", "fhornain", "hart", "hsl", "ibe", "innocenti", "iwan", "j", "james", "jason", "jason-", "je", "jeff",
#    "jelmer", "jeremy", "joel", "johnny", "jordan", "jpb%goo", "jpr", "juri", "jwa+p", "kan", "kbrede", "kenneho", "lak", "lluis",
#    "lutter", "m", "martha", "martin", "martior", "matthew", "mfarver", "michael", "mike", "milo", "mnagel%will", "nakano", "nat",
#    "nathan", "ohad", "paul", "peter", "r.i.", "rob", "rune", "shadoi", "todd", "toi", "zobbo",
  ]

  user_with_key_and_stuff { $users: }
}
