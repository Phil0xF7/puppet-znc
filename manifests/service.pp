class znc::service {
  include znc::params

  # run znc as non-root user
  exec { '/usr/bin/znc':
    user => $znc::params::znc_user,
  }
}
