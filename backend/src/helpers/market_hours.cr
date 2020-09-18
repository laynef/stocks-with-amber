module MarketHours

    class Utils
 
     def self.is_market_hours?
        time = Time.local Time::Location.load("America/New_York")
        hours = time.hour + (time.minute / 10)
        hours >= 9.3 && hours <= 16.0
     end
 
   end
 
 end