#!/usr/bin/env ruby

ENV["RAILS_ENV"] ||= "development"

require File.dirname(__FILE__) + "/../../config/application"
Rails.application.require_environment!

$running = true
Signal.trap("TERM") do 
  $running = false
end

Rails.logger.info "This daemon started!\n"

while($running) do
  
  # Replace this with your code
  EventMachine.run do
    connection = AMQP.connect(:host => "lapt02")

    channel = AMQP::Channel.new(connection)
    queue    = channel.queue("mng.to.ui", :durable => true)
    exchange = channel.direct("")

    queue.subscribe do |payload|
      obj = JSON.parse(payload)
      Rails.logger.info "Message received! #{obj}"
    end
  end
end