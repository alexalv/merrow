#!/usr/bin/env ruby
require 'rubygems'
require 'amqp'
require 'daemons'

ENV["RAILS_ENV"] ||= "development"
path = Dir.getwd

options = { :backtrace => true, :dir => '.', :log_output => true}

Daemons.run_proc('mng_recv', {}) do
  require File.join(path,'/config/environment.rb')
 
  EventMachine.run do
    connection = AMQP.connect(:host => "lapt02")

    channel = AMQP::Channel.new(connection)
    queue    = channel.queue("mng.to.ui2")
    exchange = channel.direct("")

    queue.subscribe do |payload|
      puts "Message received! #{payload}"
      #begin
        obj = JSON.parse(payload)
        puts "Message decoded! #{obj}"
        case obj['action']
        when 'INDEX'
          ActiveRecord::Base.connection_pool.with_connection do
            obj['items'].each do |item|
              puts "Creating osimage, #{item}"
              OsImage.new({:system => item['name'],:description => item['description'],:file => item['file']}).save
            end
          end
        when 'NEWSERVER'
          ActiveRecord::Base.connection_pool.with_connection do
            @Servs = Server.where("ip = ?",obj['params']['ip'])
            if not @Servs.empty?
              @Servs.each do |serv|
                serv.update_attributes({:key => obj['params']['uuid']})
              end
            else
              Server.new({:ip => obj['params']['ip'],:key => obj['params']['uuid']}).save
            end
          end
        when 'STARTED'
          ActiveRecord::Base.connection_pool.with_connection do
            @Servs = Server.where("key = ?",obj['params']['server_uuid'])
            puts obj['params']['server_uuid']
            @Servs.each do |srv|
              @sid = srv.id
            end
            puts "SID IS #{@sid}"
            VirtualMachine.where("name = ?",obj['params']['vm_id']).each do |vm|
              vm.update_attributes({:state => "running",:uuid => obj['params']['uuid'],:server_id => @sid})
            end
          end
        when 'SAVED'
          ActiveRecord::Base.connection_pool.with_connection do
            @virtual_machine = VirtualMachine.where("uuid = ?", obj['params']['uuid'])
            @virtual_machine.update_attributes({:state => "saved", :filename =>obj['params']['filename']})
          end
        when 'STOPPED'
          ActiveRecord::Base.connection_pool.with_connection do
            @virtual_machine = VirtualMachine.where("uuid = ?", obj['params']['uuid'])
            @virtual_machine.update_attributes({:state => "stopped"})
          end
        when 'SAVESTARTED'
          ActiveRecord::Base.connection_pool.with_connection do
            @virtual_machine = VirtualMachine..where("uuid = ?", obj['params']['uuid'])
            @virtual_machine.update_attributes({:state => "running"})
          end
        else
          puts "another msg"
        end
#      rescue
 #       puts "No JSON!"
  #    end
    end
  end
end