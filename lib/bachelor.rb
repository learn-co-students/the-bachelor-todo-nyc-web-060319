require "pry"
def get_first_name_of_season_winner(data, season)
  # code here
  season_won_data = data[season]
  winner_index = season_won_data.find_index{ |contestant| contestant["status"] == "Winner"}
  winner_full_name = season_won_data[winner_index]["name"]
  names = winner_full_name.split(" ")
  names[0]
end

def get_contestant_name(data, occupation)
  data.each do |season, season_data|
    contestant_index = season_data.find_index{ |contestant| contestant["occupation"] == occupation }
    if contestant_index != nil
      return season_data[contestant_index]["name"]
    end
  end
  nil
end

def count_contestants_by_hometown(data, hometown)
  count = 0
  data.each do |season, season_data|
    season_data.each do |season_contestant|
      if season_contestant["hometown"] == hometown
        count += 1
      end
    end
  end
  count
end

def get_occupation(data, hometown)
  data.each do |season, season_data|
    contestant_index = season_data.find_index{ |contestant| contestant["hometown"] == hometown }
    if contestant_index != nil
      return season_data[contestant_index]["occupation"]
    end
  end
  nil
end

def get_average_age_for_season(data, season)
  total = 0
  data[season].each do |contestant|
    total += contestant["age"].to_f
  end

 (total/ (data[season].length) ).round
end

