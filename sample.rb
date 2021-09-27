require "slack-notify"
require 'clockwork'
require 'active_support/time' #minutesなどの時間を指し示すメソッドを使える
require 'dotenv/load'

client = SlackNotify::Client.new(webhook_url: ENV['SLACK_API'])
include Clockwork
handler do |job|
  client.notify("🦄Hello There! every 3 minutes!!!🦄")
end

every(3.minutes, 'less.frequent.job')

# https://www.ownway.info/Ruby/clockwork/about

#以下でも実行可能
# every(3.minutes, 'less.frequent.job') do
#   client.notify("Hello There! every 3 minutes")
# end