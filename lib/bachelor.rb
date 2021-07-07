require 'pry'
def get_first_name_of_season_winner(data, season)
  data[season].each do |person|
    person.each do |info, detail|
      if detail == "Winner"
        #fullname=person["name"]
        firstname=person["name"].split(" ").first
        return firstname
      end
    end
  end
#firstname
end

def get_contestant_name(data, occupation)
  data.each do |season, contestants|
    contestants.each do |person|
     person.each do |info, detail|
      if detail == occupation
        name=person["name"]
        return name
      end
     end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  counter = 0
   data.each do |season, contestants|
    contestants.each do |person|
     person.each do |info, detail|
      if detail == hometown
        counter +=1
      end
     end
    end
  end
  return counter
end

def get_occupation(data, hometown)
  data.each do |season, contestants|
   contestants.each do |person|
    person.each do |info, detail|
     if detail == hometown
       return person["occupation"]
     end
    end
   end
 end
end

def get_average_age_for_season(data, season)
  count = 0
  age_sum = 0
  data[season].each do |person|
    person.each do |info, detail|
      if info == "age"
        count += 1
        age_sum += detail.to_f
      end
    end
  end
  avg_age=(age_sum/count).round
  return avg_age
end
