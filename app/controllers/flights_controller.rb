class FlightsController < ApplicationController
    def index
        @dates = Flight.unique_dates
        if params[:from_airport_id]
            f_date = Date.strptime(params[:date], '%m/%d/%Y')
            @flights = Flight.where("from_airport_id = ? AND to_airport_id = ?", params[:from_airport_id], params[:to_airport_id]).where(date: f_date.beginning_of_day..f_date.end_of_day)
            
            #This is what I used before using unique dates in select box
            # @flights  Flight.where("from_airport_id = ? AND to_airport_id = ?", params[:from_airport_id], params[:to_airport_id]).where(date: params[:date].to_datetime.beginning_of_day..params[:date].to_datetime.end_of_day)

            @num_tickets = params[:num_tickets]
        end

        
    end
end
