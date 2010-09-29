#!/usr/bin/env ruby -w

require 'rinda/ring'
require 'rinda/tuplespace'
require 'worker_task'

ts = DRbObject.new nil, 'druby://137.112.147.92:1234'

# Wait for tasks, pull them off and run them
#
loop do
  tuple = ts.take(['task', nil, nil])
  task = tuple[2]
  print "taking task #{task.task_id}... "
  
  result = task.run
  puts "done"
  
  ts.write(['result', tuple[1], task.task_id, result])
end
