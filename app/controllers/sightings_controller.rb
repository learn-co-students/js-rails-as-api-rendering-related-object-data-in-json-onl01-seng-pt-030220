class SightingsController < ApplicationController
    
    def index
        sightings =Sighting.all
        render json: sightings.to_json(include: [:bird, :location])
    end


    def show
        sighting = Sighting.find_by(:id => params[:id])
        ##show normal will show location_id and bird_id
        ##render json: sighting
        ##custom hash to show location and bird info
        ##render json: { id: sighting.id, bird: sighting.bird, location: sighting.location }
        if sighting
            render json: sighting.to_json(:include => {:bird =>{:only =>[:name, :species]},
             :location => {:only=>[:latitude, :longitude]}},:except => [:updated_at])
   
               
        else
            render json: {message:"NO sighting found with this id"}
        end


    end


end
