class FoodsController < ApplicationController
  def index
    render json: { records: Food.all }
  end
end
