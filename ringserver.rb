#!/usr/bin/env ruby -w

# Rinda RingServer

require 'rinda/ring'
require 'rinda/tuplespace'
require 'drb'

DRb.start_service 'druby://localhost:1234', Rinda::TupleSpace.new

DRb.thread.join
