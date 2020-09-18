module MarketHours

    class Utils
 
     def self.is_market_hours?
        time = Time.local Time::Location.load("America/Los_Angeles")
        hours = time.hour + (time.minute / 10)
        hours >= 6 && hours <= 16.0
     end
 
   end
 
 end