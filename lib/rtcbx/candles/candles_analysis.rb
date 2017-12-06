class RTCBX
  class Candles < RTCBX
    # Simple collection of commands to get info about the orderbook. Add our own
    # methods for calculating whatever it is you feel like calculating.
    #
    module CandlesAnalysis
      def candles_count
        @candles.count
      end

      def average_price_movement(last_n = 10)
        movements = @candles.last(last_n).map { |candle| candle.high - candle.low }
        movements.sum / movements.count
      end
    end
  end
end
