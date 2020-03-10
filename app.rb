require('sinatra')
#the development environment is set to true right now and not development. but if it is set to false, then we must load in this gem
require('sinatra/contrib/all') if development?

#the script here will have a series of get requests which ask the server to give back some specific response
#this picks a default port on our local machine of 4567. this port will send out information from our local machine to the internet
get('/') do
  "Nobody tosses a dwarf!"
end

#if we go to a web browser and type in     localhost:4567/hi, we get to a page that prints out the above string

get('/hi') do
  "Ride, ride to ruin and the world's ending!"
end

get('/roll-die') do
  "The result is #{rand(1..6)}"
end

#the colon in this request is a wildcard and means we are expecting some kind of input from our user
# get('/name/:first/:last') do
#   #this returns the first and last name as a hash in the browser page
#   return params.to_s()
# end

#you can do string interpolation of the hash using this setup. So we create a dynamic relationship between the request and response
#the wildcards are stored in a params called hash
get('/name/:first/:last') do
  return "Your first name is #{params[:first]} #{params[:last]}"
end

get('/friends/naemates') do
  return "I have nae mates"
end

get('/friends/:number') do
  friends=["Joey", "Chandler", "Ross", "Monica", "Rachel", "Phoebe"]
  #anything the user enters defaults to a string, so we have to convert back to an integer. We also need to anticipate the user will enter in 1 for the first element, not zero, so we must account for this as well
  #also important is to include a space so that it gets interpreted as subtracting 1, not just some integer -1
  index= params[:number].to_i - 1
  #this will return some friend in the array at the index place
  return friends[index]
end

get('/square/:num') do
  num = params[:num].to_i
  return "number squared = #{num * num}"
end

#this get request will default to returning Phoebe, because the above get request of /friends wanted to get a number. strings default with to_i() as zero, and the index of phoebe in the array is -1.
#so to get this to work, we need to put this before the other /friends get request.
# get('/friends/naemates') do
#   return "I have nae mates"
# end
