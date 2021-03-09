
s = Time.now
%x{shpg generate}
e = Time.now
l = e-s
d = l
while d <= l do
  puts("Before: d,l: #{[d,l].to_s}") 
  s = Time.now
  %x{shpg generate}
  e = Time.now
  l = d
  d = e-s
  puts("After: d,l: #{[d,l].to_s}")
  puts()
end


