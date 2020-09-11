class SightingsController < ApplicationController
    def index
        sightings = Sighting.all
        render json: { id: sighting.id, bird: sighting.bird, location: sighting.location }
    end
    
    def show
        if sighting = Sighting.find_by(id: params[:id])
            render json: { id: sighting.id, bird: { id: sighting.bird.id, name: sighting.bird.name, species: sighting.bird.species }, location: { id: sighting.location.id, latitude: sighting.location.latitude, longitude: sighting.location.longitude } }
        else
            render json: { message: 'No sighting found with that id' }
        end
    end
end
