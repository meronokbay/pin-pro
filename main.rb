#! /usr/bin/env ruby
# frozen_string_literal: true

require 'discordrb'

bot = Discordrb::Commands::CommandBot.new token: ENV['TOKEN'], client_id: 168_123_456_789_123_456, prefix: '%'

users = Hash.new([])

bot.command :pin do |event, *text|
  users[event.user].push(*text.join(' '))
  event.respond "\"#{text.join(' ')}\" has been pinned!"
end

bot.command :read do |event|
  users[event.user]
end

bot.command :remove do |event, index|
  users[event.user].delete_at(index.to_i)
end

bot.run
