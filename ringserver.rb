#!/usr/bin/env ruby -w

# Rinda RingServer

require 'rinda/ring'
require 'rinda/tuplespace'
require 'drb'

DRb.start_service 'druby://137.112.147.92:1234', Rinda::TupleSpace.new

DRb.thread.join
