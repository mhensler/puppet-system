# == Class: system::stages
#
# This class manages a standard set of run stages for the system module.
#
# In order, the stages are:
#
# * first
# * second
# * third
# * main
# * last
#
# === Parameters
#
# None
#
# === Authors
#
# Andrew Kroh <andy@crowbird.com>
#
class system::stages () {

  ensure_resource('stage', ['first', 'second', 'third', 'last'], {})

  Stage['first'] ->
  Stage['second'] ->
  Stage['third'] ->
  Stage['main'] ->
  Stage['last']

}
