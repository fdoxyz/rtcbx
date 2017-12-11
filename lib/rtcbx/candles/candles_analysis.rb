class RTCBX
  class Candles < RTCBX
    # Simple collection of commands to get info about the orderbook. Add our own
    # methods for calculating whatever it is you feel like calculating.
    #
    module CandlesAnalysis
      # Number of all current candles tracked
      def candles_count
        @candles.count
      end

      # The average movement (from high to low) from the last_n candles.
      # moving_candles param will filter out candles without movement
      def average_movement(last_n: 10, non_zero: false)
        target_candles = @candles unless non_zero
        target_candles ||= @candles.select { |c| (c.high - c.low) > 0 }
        movements = target_candles.last(last_n).map { |c| c.high - c.low }
        movements.sum / BigDecimal.new(movements.count)
      end
    end
  end
end
