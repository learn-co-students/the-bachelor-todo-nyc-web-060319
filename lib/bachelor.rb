# data = { 										# Key = data,   val = seasons
#   "season 30": [								# Key = season, val = array/contesants
#     {   										# Key = array/contes.   val = info hashes
#       "name":      "Beth Smalls",				# Key = an info (name,etc)     val = val
#       "age":       "26",
#       "hometown":  "Great Falls, Virginia",
#       "occupation": "Nanny/Freelance Journalist",
#       "status":    "Winner"
#     },
#     {
#       "name":       "Becca Tilley",
#       "age":        "27",
#       "hometown":   "Shreveport, Louisiana",
#       "occupation": "Chiropractic Assistant",
#       "status":     "Eliminated Week 8"
#     }
#   ],
#   "season 29": [
#       {
#          "name": "Jillian Anderson",
#          "age": "25",
#          "hometown": "Howland, Ohio[f]",
#          "occupation": "News Producer",
#          "status": "Eliminated in episode 4"
#       },
#   ]
# }


def get_first_name_of_season_winner(data, season)
	input_data = {}		# Create it as hash where data is the key, JSON is the value
	input_data = data
  winner = input_data[(season).to_sym].select { |contestant| contestant[:status] == "Winner"}
  #winner = input_data[("season #{season}").to_sym].select { |contestant| contestant[:status] == "Winner"}
  winner = winner[0][:name] 	# ^ returns an array
  winner = winner.split
  winner = winner[0]
  #puts ("Winner is #{winner}")
end

# This input gets the right answer, not sure why it's not passing the tests.. 
#  puts (get_first_name_of_season_winner({ 										 
#   "season 30": [								
#     {   										
#       "name":      "Beth Smalls",				
#       "age":       "26",
#       "hometown":  "Great Falls, Virginia",
#       "occupation": "Nanny/Freelance Journalist",
#       "status":    "Winner"
#     },
#     {
#       "name":       "Becca Tilley",
#       "age":        "27",
#       "hometown":   "Shreveport, Louisiana",
#       "occupation": "Chiropractic Assistant",
#       "status":     "Eliminated Week 8"
#     }
#   ],
#   "season 29": [
#       {
#          "name": "Jillian Anderson",
#          "age": "25",
#          "hometown": "Howland, Ohio[f]",
#          "occupation": "News Producer",
#          "status": "Eliminated in episode 4"
#       },
#   ]
# }, 'season 30'))







def get_contestant_name(data, occupation)
	return_val = ""

	data.each do |season, contestant_array|
		contestant_array.each do |contestant|
	  		if ( contestant.fetch(:occupation) == occupation )
	  			#puts contestant.fetch(:name)
	  			return_val = contestant.fetch(:name)
	  		end
	  	end
	 end
	 return_val
  #print( data.detect{ |occupation| data[:occupation] == "#{occupation}" } )
end
# puts (get_contestant_name(data, "News Producer"))




def count_contestants_by_hometown(data, hometown)
	counter = 0

	data.each do |season, contestant_array|
		contestant_array.each do |contestant|
	  		if ( contestant.fetch(:hometown) == hometown )
	  			counter += 1 
	  		end
	  	end
	 end
	 return counter
end
#puts ( count_contestants_by_hometown(data, "Shreveport, Louisiana") )




def get_occupation(data, hometown)
	data.each do |season, contestant_array|
		contestant_array.each do |contestant|
	  		if ( contestant.fetch(:hometown) == hometown )
	  			#puts( "occupation for hometown is  #{contestant.fetch(:occupation) }")
	  			return contestant.fetch(:occupation)
	  		end
	  	end
	 end
end
#puts ( get_occupation(data, "Shreveport, Louisiana") )





def get_average_age_for_season(data, season)
  ages = data[("season #{season}").to_sym].collect { |contestant| contestant[(:age)] }
  ages = ages.map { |n|  n.to_i }		# Works w .map /  W .each, ages= ["26", "27"]. Weird. 
  #puts ( "Ages  1. is #{ages}")  
  ages =  (ages.inject{ |sum, n| sum + n.to_f } / ages.size) 
  #puts ( "Ages is #{ages}")
end

#puts get_average_age_for_season(data, 30)
