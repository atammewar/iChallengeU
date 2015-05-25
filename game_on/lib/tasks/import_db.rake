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
	bikes = hash.delete('Bike')
	bikes.each do |b|
		user = User.find_by_name(b['User'])
		duration = b['Time']
		distance = b['Distance']
		newRecord = BikeRecord.create(:duration => duration, :distance => distance)
		user.exercises << newRecord
		# puts "#{distance}\t#{duration}\t#{user.email}"
	end

	## Handle RunRecords
	runs = hash.delete('Run')
	runs.each do |r|
		user = User.find_by_name(r['User'])
		duration = r['Time']
		distance = r['Distance']
		newRecord = RunRecord.create(:duration => duration, :distance => distance)
		user.exercises << newRecord
	end

	## Handle WeightRecords
	weights = hash.delete('Weights')
	weights.each do |w|
		user = User.find_by_name(w['User'])
		duration = w['Time']
		distance = w['Distance']
		newRecord = WeightRecord.create(:duration => duration)
		user.exercises << newRecord
	end
end