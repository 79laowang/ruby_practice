#!/usr/bin/ruby -w
# -*- coding : utf-8 -*-

# Note: no space between << and EOF
print <<EOF
    Create the here document.
    new line
EOF

print <<"EOF";
    Create the here document.
    another format 
EOF

print <<`EOF`
    echo "hello"
    echo "Run shell"
EOF

print <<"foo", <<"bar"
    The first doc,
foo
    The second doc.
bar

puts "Save here doc to file!"
text = <<`foo`
    cat ~/.bash_profile
foo
puts text

File.open("/tmp/abc", "w") do |io|
    io.write(text)
end
puts "----------------------------"
exec "ls -al /tmp/ && cat /tmp/abc"
