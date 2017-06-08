{
	db: {
		adapter: 'mysql2',
		host: 'localhost',
		name: 'fulllab',
		database: ENV['CLEARDB_DATABASE_URL'],
		user: ENV['CLEARDB_DATABASE_USERNAME'],
		password: ENV['CLEARDB_DATABASE_PASSWORDs']
	}
}