require 'map_reduce_job'
require 'pp'

job = MapReduceJob.new ARGV.shift
#job.data = File::readlines('/Users/davidpick/Documents/shaks12.txt')
job.data = File::readlines('/Users/davidpick/Documents/Scripts/movefiles.rb')
job.partition = Partitioner::array_data_split_by_first_entry

job.map = lambda do |lines|
  result = Array.new

  lines.each do |line|
    line.scan(/\w+/).each do |word|
      result << [word, 1]
    end
  end

  result
end


job.reduce = lambda do |pairs|
  totals = Hash.new

  pairs.each do |pair|
    word, count = pair[0], pair[1]

    totals[word] ||= 0
    totals[word] += count
  end

  totals
end

result = job.run

result.each do |partition|
  pp partition
  #partition.each_pair do |word, total|
  #  printf "%3d: %s\n", total, word
  #end
end
