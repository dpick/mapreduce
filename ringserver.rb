#!/usr/bin/env ruby -w

# Rinda RingServer

require 'rinda/ring'
require 'rinda/tuplespace'

# start DRb
DRb.start_service

# Create a TupleSpace to hold named services, and start running
#Rinda::RingServer.new Rinda::TupleSpace.new
ts = Rinda::TupleSpace.new
DRb.start_service('druby://localhost:12345', ts)

# Wait until the user explicitly kills the server.
DRb.thread.join
