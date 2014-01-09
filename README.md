# ZNC Puppet Module

## Description
Module to install and start the ZNC IRC network bouncer

## Usage

Minimal install

```puppet
    class { 'znc':
      username => 'yourname',
      password => 'sha256#longhashedpassword#thesalt',
    }
```

Admin install with modules/network/channel

```puppet
    class { 'znc':
      username      => 'yourname',
      password      => 'sha256#longhashedpassword#thesalt',
      admin         => true,
      server_name   => 'irc.freenode.net',
      global_mod    => ['partyline', 'webadmin'],
      user_mod      => ['chansaver', 'controlpanel', 'perform'],
      chan_name     => '#myownchannel123',  
    }
```

## Limitations
This module has been tested on:

* Debian 7
