require 'sinatra'

get '/' do
	redirect '/tickets'
end

get '/tickets' do
	$from = params['from']
	$to = params['to']
	$order = params['order']

	erb :index
end