class znc::config {
  include znc

  File {
    owner => $znc::znc_user,
    group => $znc::znc_group,
  }

  $znc_homedir = "/home/${znc::znc_user}"
  $znc_conf = "${znc_homedir}/.znc/configs/znc.conf"
  $znc_dirs = [ "${znc_homedir}/.znc/",
                "${znc_homedir}/.znc/configs",
                "${znc_homedir}/.znc/modules",
                "${znc_homedir}/.znc/users"
              ]

  file { $znc_dirs:
    ensure => "directory",
  }

  concat { $znc_conf:
    owner => $znc::znc_user,
    group => $znc::znc_group,
    mode => "0644",
  }

  concat::fragment { 'znc_header':
    target => $znc_conf,
    content => template('znc/listener.erb'),
    order => '01',
  }

  znc::user { 'default':
    username => $znc::username,
  }

  if $znc::ssl and $znc::create_pem {
    exec { 'create pem':
      path => '/usr/bin',
      command => 'znc -p',
      user => $znc::znc_user,
      require => File[$znc_dirs],
    }
  }

  if $znc::manage_user {
    user { $znc::znc_user:
      ensure => present,
      gid => $znc::znc_group,
      managehome => true,
    }
  }

  if $znc::manage_group {
    group { $znc::znc_group:
      ensure => present,
    }
  }
}  
