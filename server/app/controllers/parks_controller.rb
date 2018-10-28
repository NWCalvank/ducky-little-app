class ParksController < ApplicationController
  def index
    render json: { records: Park.all }
  end
end
