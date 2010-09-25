#!/usr/bin/env ruby -w

# Rinda RingServer

require 'rinda/ring'
require 'rinda/tuplespace'
require 'drb'
require 'worker_task'

DRb.start_service 'druby://137.112.147.92:1234', Rinda::TupleSpace.new

class Test
end

DRb.thread.join
