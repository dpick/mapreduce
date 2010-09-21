#!/usr/bin/env ruby -w
#
# Copyright (c) 2006 Josh Carter <josh@multipart-mixed.com>
#
# All rights reserved.  You can redistribute and/or modify this under
# the same terms as Ruby.
#

require 'rinda/ring'
require 'worker_task'

# Start Rinda and find TupleSpace
#
DRb.start_service

ts = DRbObject.new nil, 'druby://137.112.147.92:1234'

# Wait for tasks, pull them off and run them
#
loop do
  tuple = ts[:task].shift
  task = tuple[2]
  print "taking task #{task.id}... "
  
  result = task.run
  puts "done"
  
  ts[:result] << ['result', tuple[1], task.task_id, result]
end
