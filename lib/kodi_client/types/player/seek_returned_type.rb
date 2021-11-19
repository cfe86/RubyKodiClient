# frozen_string_literal: true

module KodiClient
  module Types
    module Player
      # return value of Player.Seek
      class SeekReturned
        include Extensions::Comparable
        extend Extensions::Creatable

        attr_reader :percentage, :time, :total_time

        type_mapping ['time', Global::GlobalTime], ['totaltime', Global::GlobalTime]

        def initialize(percentage, time, total_time)
          @percentage = percentage
          @time = time
          @total_time = total_time
        end
      end
    end
  end
end
