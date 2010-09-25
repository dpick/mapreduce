#!/usr/bin/env ruby -w
#
# Copyright (c) 2006 Josh Carter <josh@multipart-mixed.com>
#
# All rights reserved.  You can redistribute and/or modify this under
# the same terms as Ruby.
#

require 'rinda/ring'
require 'rinda/tuplespace'
require 'worker_task'


#DRb.start_service 'druby://localhost:1234', Rinda::TupleSpace.new

ts = DRbObject.new nil, 'druby://localhost:1234'

puts ts.take(['task', nil, nil])

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
