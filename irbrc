require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"

require 'awesome_print'
AwesomePrint.irb!

%w(awesome_print).each do |lib|
  begin
    require lib
  rescue LoadError
    puts "Unable to load #{lib}. Continuing, but you may want to run 'gem install #{lib}'"
  end
end

begin
if defined?(AwesomePrint)
  require "awesome_print"
  AwesomePrint.irb!
end
rescue Exception => e
  puts "Exception: #{e}"
end
