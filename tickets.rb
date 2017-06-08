require 'sinatra'
require 'mysql2'
require 'json'

get '/' do
	erb :'index'
end

get '/tickets' do
	$from = params['from'].to_s.downcase
	$to = params['to'].to_s.downcase
	$order = params['order'].to_s.downcase
	$order_type = params['order_type'].to_s.downcase

	$order_type = "asc" unless $order_type || $order_type != ""

	client = Mysql2::Client.new(
		host: 'us-cdbr-iron-east-03.cleardb.net',
		username: 'b63406ed458aee',
		password: '9478b56d',
		database: 'heroku_00b354e8864d5f4',
		encoding: 'utf8'
	)

	query = "SELECT * FROM `tickets` "
	
	query += "WHERE " if ($from && $from != "") || ($to && $to != "")
	query += "`from` LIKE '%#{$from}%' " if $from && $from != ""
	query += "AND " if $from && $from != "" && $to && $to != ""
	query += "`to` LIKE '%#{$to}%' " if $to && $to != ""

	query += "ORDER BY `#{$order}` #{$order_type}" if ($order == "price" || $order == "company" || $order == "departure_date") && ($order_type == "asc" || $order_type == "desc")

	result = client.query(query)

	result_hash = result.map do |row|
		{
			price: row['price'],
			from: row['from'],
			to: row['to'],
			image: row['image'],
			company: row['company'],
			url: row['url'],
			departure_date: row['departure_date']
		}
	end

	result_hash.to_json
end