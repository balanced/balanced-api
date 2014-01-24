Then(/^debug$/) do
  puts "HTTP status code: #{@client.last_code}"
  puts "HTTP body: #{@client.last_body}"
  puts "hydrate tokens: #{@client.hydrate_tokens}"
end

require 'logger'
$logger = Logger.new(STDOUT)
$logger.level = Logger::FATAL

When(/^logging is enabled$/) do
  $logger.level = Logger::DEBUG
end
