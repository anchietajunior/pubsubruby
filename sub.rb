require 'redis'
require 'json'

$redis = Redis.new

$redis.subscribe('sinatra', 'ruby', 'londrina') do |on|
  on.message do |channel, msg|
    data = JSON.parse(msg)
    puts "Canal: #{channel} - User: #{data['user']} - MSG: #{data['msg']}"
  end
end
