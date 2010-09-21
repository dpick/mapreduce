#!/usr/bin/env ruby -w

# Rinda RingServer

require 'rinda/ring'
require 'rinda/tuplespace'

# start DRb
DRb.start_service 'druby://137.112.112.150:1234', {:task => [], result => []}

puts DRb.uri

# Create a TupleSpace to hold named services, and start running

# Wait until the user explicitly kills the server.
DRb.thread.join
