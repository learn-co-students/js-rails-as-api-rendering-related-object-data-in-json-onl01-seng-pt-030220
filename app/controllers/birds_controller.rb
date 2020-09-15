class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: bird
  end
end