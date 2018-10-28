class ReportsController < ApplicationController
  before_action :check_params
  before_action :set_end_date

  def show
    send_data(
      Report.new(@end_date).to_csv,
      filename: "report-#{Time.now}.csv",
      type: Mime[:csv]
    )
  end

  private

  def set_end_date
    year, month, day = params[:end_date].split('-')
    @end_date = Date.new(year.to_i, month.to_i, day.to_i)
  end

  def check_params
    render status: :bad_request, json: {
      errors: ['Invalid Request', 'Missing required field end_date'],
    } if params[:end_date].nil?
  end
end
