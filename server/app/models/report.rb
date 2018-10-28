require 'csv'

class Report

  def initialize(end_date)
    @columns = %w{park amount duck_count time food}
    @assocs = %w{park food}
    @feedings = Feeding.all.to_a
    @end_date = end_date
  end

  def to_csv
    CSV.generate(headers: true) do |csv|
      csv << format_columns(@columns)
      @feedings.each do |feeding|
        repeat_days(feeding) if feeding.daily
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

  def repeat_days(feeding)
    repetitions = (@end_date - feeding.time.to_date).to_i
    (0...repetitions).each do |i|
      new_time = feeding.time + (i + 1).days

      scheduled_feeding = feeding.dup
      scheduled_feeding.daily = false
      scheduled_feeding.time = new_time
      @feedings << scheduled_feeding
    end
  end
end
