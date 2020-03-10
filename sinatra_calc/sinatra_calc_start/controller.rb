require('sinatra')
require('sinatra/contrib/all')

require_relative('models/calculator')
also_reload('./models/*')

# get('/add/:num1/:num2') do
#   return "The add result is #{Calculator.add(params[:num1].to_i, params[:num2].to_i)}"
# end

get('/root/:num1/:num2') do
  return "The nth root (where n equals #{params[:num2]}) is #{Calculator.root(params[:num1].to_i(), params[:num2].to_i())}"
end

#we must tell the controller where to render the calculation variable to. note that the desired location must have the same name as the .erb file we, which is result.erb
get('/subtract/:num1/:num2') do
  @calculation = "#{params[:num1].to_i - params[:num2].to_i}"
  erb(:result)
end

get('/add/:num1/:num2') do
  @calculation = "#{Calculator.add(params[:num1].to_i, params[:num2].to_i)}"
  erb(:result)
end

get("/") do
  erb(:home)
end

get("/about_us") do
  erb(:about_us)
end
