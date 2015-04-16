require 'sinatra'

filename = ARGV[0] || "response.xml" 

if not File.exist? filename
  puts "Add the path to a file containing the response to return as an argument or create response.json in this directory."
  exit
end

set :mock, File.open(filename, 'r').read

get '/*' do
  settings.mock
end

post '/*' do
 settings.mock
end
