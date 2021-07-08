require "pry"

def get_first_name_of_season_winner(data, season)
  winning_name = nil
  data[season].each do |contest_hash|
    if contest_hash["status"] == "Winner"
      winning_name = contest_hash["name"].split[0]
    end
  end
  return winning_name
end

def get_contestant_name(data, occupation)
  name = nil

  data.each do |season, contest_arr|
    contest_arr.each do |contest_hash|
      if contest_hash["occupation"] == occupation
        name = contest_hash["name"]
      end
    end
  end
  return name
end

def count_contestants_by_hometown(data, hometown)
  count = 0
  data.each do |season, contest_arr|
    contest_arr.each do |contest_hash|
      if contest_hash["hometown"] == hometown
        count += 1
      end
    end
  end
  return count
end

def get_occupation(data, hometown)
  
  data.each do |season, contest_arr|
    contest_arr.each do |contest_hash|
      if contest_hash["hometown"] == hometown
        return contest_hash["occupation"]
      end
    end
  end
  return name

end

def get_average_age_for_season(data, season)
  sum = 0
  num = 0
  data[season].each do |contest_hash|
    sum += contest_hash["age"].to_i
    num += 1
  end
  return (sum.to_f/num).round 
end
