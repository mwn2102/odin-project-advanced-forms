class FlightsController < ApplicationController
    def index
        if params[:from_airport_id]
            @flights = Flight.where("from_airport_id = ? AND to_airport_id = ?", params[:from_airport_id], params[:to_airport_id]).where(date: params[:date].to_datetime.beginning_of_day..params[:date].to_datetime.end_of_day)
                #or params event_date_formatted 
            @num_tickets = params[:num_tickets]
        end

        
    end
end
