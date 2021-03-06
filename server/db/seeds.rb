require 'csv'

# PARKS
parks_csv_file = File.open(Rails.root + "db/seed_data/parks.csv")
parks_csv = CSV.parse(parks_csv_file, headers: true)
parks_csv.each do |row|
  hash = row.to_hash
  if Park.find_by(key: hash['key']).nil?
    Park.create!(
      key: hash['key'],
      name: hash['name'],
      country: hash['country']
    )
  end
end

# FOODS
foods = %w(Seeds Grains Plants Insects)
foods.each do |name|
  if Food.find_by(name: name).nil?
    Food.create!(name: name)
  end
end
