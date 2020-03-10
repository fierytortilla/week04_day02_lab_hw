require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('models/film')
require_relative('models/customer')
require_relative('models/ticket')
require_relative('models/screening')

also_reload('./models/*')

get("/") do
  erb(:home)
end

get("/films") do
  @films= Film.all()
  erb(:films)
end

get("/films/:num") do
  @film= Film.find_by_id(params[:num])
  erb(:result)
end
