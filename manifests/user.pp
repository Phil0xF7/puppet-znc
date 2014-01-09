define znc::user(
  $username,
  $nick = undef,
  $alt_nick = undef,
  $ident = undef,
) {
  include znc::params

  # if nick/alt_nick/ident is undef
  if $nick { 
    $nickd = $nick
  }
  else {
    $nickd = $username
  }

  if $alt_nick {
    $alt_nickd = $alt_nick
  }
  else {
    $alt_nickd = "${username}_"
  }

  if $ident {
    $identd = $ident
  }
  else {
    $identd = $username
  }

  concat::fragment { "znc_user_${username}":
    target => "/home/${znc::params::znc_user}/.znc/configs/znc.conf",
    content => template('znc/user.erb'),
  }


}
