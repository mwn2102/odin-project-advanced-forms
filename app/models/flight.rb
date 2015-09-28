class Flight < ActiveRecord::Base
    belongs_to :from_airport, class_name: "Airport"   
    belongs_to :to_airport, class_name: "Airport"     
    has_many :bookings
    has_many :passengers, through: :bookings
    
    def event_date_formatted     
      date.strftime("%m/%d/%Y")  
    end
    
end
