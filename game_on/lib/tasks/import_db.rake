task :import => :environment do
   parent =  File.join File.dirname(__FILE__).split(File::SEPARATOR)[0..-4]
   file_path = File.join parent.split(File::SEPARATOR).push('scripts', 'db', 'DB_Dump.json')

   fc = File.open(file_path)
   hash = JSON.parse(fc.read)

   ## Handle Users
   users = hash.delete('User')												## handle 
   users.each do |u| 
      nu = User.create(u)	
   end

   ## Handle BikeRecords
   bike_duration_multiplier = 0.0027778
   bike_distance_multiplier = 0.5
   bikes = hash.delete('Bike')
   bikes.each do |b|
      user = User.find_by_name(b['User'])
      duration = b['Time']
      distance = b['Distance']
      newRecord = BikeRecord.create(:duration => duration, :distance => distance)
      user.exercises << newRecord
   end

   ## Handle RunRecords
   run_duration_multiplier = 0.0041667
   run_distance_multiplier = 0.5
   runs = hash.delete('Run')
   runs.each do |r|
      user = User.find_by_name(r['User'])
      duration = r['Time']
      distance = r['Distance']
      newRecord = RunRecord.create(:duration => duration, :distance => distance)
      user.exercises << newRecord
   end

   ## Handle WeightRecords
   weight_duration_multiplier = 0.0047222
   weights = hash.delete('Weights')
   weights.each do |w|
      user = User.find_by_name(w['User'])
      duration = w['Time']
      newRecord = WeightRecord.create(:duration => duration)
      user.exercises << newRecord
   end
end
