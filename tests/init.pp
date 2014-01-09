# The baseline for module testing used by Puppet Labs is that each manifest
# should have a corresponding test manifest that declares that class or defined
# type.
#
# Tests are then run by using puppet apply --noop (to check for compilation
# errors and view a log of events) or by fully applying the test in a virtual
# environment (to compare the resulting system state to the desired state).
#
# Learn more about module testing here:
# http://docs.puppetlabs.com/guides/tests_smoke.html
#
class { "znc":
  username => 'znc_user',
  password => 'sha256#043321a8fdd0f05d6cd80da713b558c6e41598b5bb8abf3dd0ee764856c05c71#jS)kWeWrx*6YfH4S03e7',
}
