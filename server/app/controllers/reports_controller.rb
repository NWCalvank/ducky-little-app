class ReportsController < ApplicationController
  def show
    send_data(
      Report.new().to_csv,
      filename: "report-#{Time.now}.csv",
      type: Mime[:csv]
    )
  end
end
