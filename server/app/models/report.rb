require 'csv'

class Report

  def initialize
    @columns = %w{park amount duck_count time food}
    @assocs = %w{park food}
    @feedings = Feeding.all
  end

  def to_csv
    CSV.generate(headers: true) do |csv|
      csv << format_columns(@columns)
      @feedings.each do |feeding|
        csv << build_columns(feeding)
      end
    end
  end

  private

  def build_columns(feeding)
    @columns.map do |attr|
      val = feeding.send(attr)
      if @assocs.include? attr
        assoc = feeding.send(attr)
        val = assoc.name
      end
      val.is_a?(Time) ? format_date(val) : val
    end
  end

  def format_columns(columns)
    columns.map(&:titleize)
  end

  def format_date(time)
    time.to_date
  end
end
