class znc(
  $admin = false,
  $alt_nick = undef,
  $buffer = 50,
  $chan_name = undef,
  $chan_keepbuffer = undef,
  $chan_buffer = undef,
  $chan_detach = undef,
  $chan_key = undef,
  $chan_modes = undef,
  $keepbuffer = true,
  $create_pem = true,
  $global_mod = [],
  $host = undef,
  $ident = undef, 
  $ipv4 = true,
  $ipv6 = true,
  $manage_user = true,
  $manage_group = true,
  $modes = '+stn',
  $ssl = false,
  $listenerport = 1025,
  $net_mod = [],
  $nick = undef,
  $server_name = undef,
  $server_port = 6667,
  $password,
  $realname = "Got ZNC?",
  $server = undef,
  $server_port = 6667,
  $user_mod = [],
  $username,
  $znc_user = $znc::params::znc_user,
  $znc_group = $znc::params::znc_group,
) inherits znc::params {

  anchor { 'znc::begin': } ->
  class { 'znc::install': } ->
  class { 'znc::config': } ->
  class { 'znc::service': } ->
  anchor { 'znc::end': }

}
