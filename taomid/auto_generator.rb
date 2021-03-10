while true do 
  s = Time.now
  puts %x[shpg generate]
  e = Time.now
  puts("Execution time: #{e-s}")
  puts("================================")
  if ARGV[0].to_i>0 and ARGV[0].to_i<10 then sleep(ARGV[0].to_i) else sleep(2) end
  puts ARGV.to_s
end

