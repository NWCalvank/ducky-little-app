require 'csv'

class Report
  def self.to_csv
    columns = %w{park amount duck_count time food}
    assocs = %w{park food}
    feedings = Feeding.all

    CSV.generate(headers: true) do |csv|
      csv << columns

      feedings.each do |feeding|
        csv << columns.map do |attr|
          val = feeding.send(attr)
          if assocs.include? attr
            assoc = feeding.send(attr)
            val = assoc.name
          end
          val
        end
      end
    end
  end
end
