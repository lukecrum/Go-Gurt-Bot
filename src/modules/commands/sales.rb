require 'stock-markit'
module Bot::DiscordCommands
  # Responds with "Pong!".
  # This used to check if bot is alive
  module Sales
    extend Discordrb::Commands::CommandContainer
    command :sales do |_event|
      percent = StockMarkit.quote(:gis).change_percent
      "Gogurt stock #{up_or_down(percent)} #{percent.to_s}%"
    end
    def self.up_or_down(change)
      if change > 0
        'is up'
      elsif change < 0
        'is down'
      else
        'is the same:'
      end
    end
  end
end
