class FeedingsController < ApplicationController
  # TODO: I don't have time to implement a policy + serializer
  before_action :check_params
  before_action :build_params

  REQUIRED_PARAMS = %w(food_id amount duck_count time park_id daily)

  def create
    @new_feeding = Feeding.new(@params)
    @new_feeding.save!
    render json: @new_feeding
  end

  private

  def check_params
    bad_request unless REQUIRED_PARAMS.all?{|rp| params.keys.include? rp}
  end

  def build_params
    @params = {}
    @params[:food_id] = params[:food_id]
    @params[:park_id] = params[:park_id]
    @params[:amount] = params[:amount]
    @params[:duck_count] = params[:duck_count]
    @params[:time] = parsed_time
    @params[:daily] = params[:daily]
  end

  def parsed_time
    year, month, day = params[:time].split('-')
    Time.new(year.to_i, month.to_i, day.to_i)
  end

  # TODO: Generalize error response pattern at application level
  def bad_request
    render status: :bad_request, json: {
      errors: ['Invalid Request', 'Missing one or more required fields.'],
    }
  end
end
