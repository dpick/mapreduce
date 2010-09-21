#!/usr/bin/env ruby -w

# Rinda RingServer

require 'rinda/ring'
require 'rinda/tuplespace'

# start DRb
DRb.start_service nil, Rinda::TupleSpace.new

puts DRb.uri

# Create a TupleSpace to hold named services, and start running

# Wait until the user explicitly kills the server.
DRb.thread.join
