require 'pry'

pigeon_data = {
  :color => {
    :purple => ["Theo", "Peter Jr.", "Lucky"],
    :grey => ["Theo", "Peter Jr.", "Ms. K"],
    :white => ["Queenie", "Andrew", "Ms. K", "Alex"],
    :brown => ["Queenie", "Alex"]
  },
  :gender => {
    :male => ["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky"],
    :female => ["Queenie", "Ms. K"]
  },
  :lives => {
    "Subway" => ["Theo", "Queenie"],
    "Central Park" => ["Alex", "Ms. K", "Lucky"],
    "Library" => ["Peter Jr."],
    "City Hall" => ["Andrew"]
  }
}


def nyc_pigeon_organizer(data)
  output_hash = {}

  data.each do |category, value_option|
    value_option.each do |value_key, names|
      names.each do |name|
        if output_hash.include?(name) == false 
          output_hash[name] = {category => []}
        #leaving this as an else though  might want to add a check
        #to see if the category is already added in case that category is
        #repeated more than once in the original hash 
        elsif output_hash.include?(name) && !output_hash[name].include?(category)
          output_hash[name][category] = []
        else
          #do nothing 
        end 
        #didn't make sense to include this in the if statements since it 
        #would've have to go multiple places but I don't 
        #love that there is a separate new if statement 
        if names.include?(name)
          output_hash[name][category] << value_key.to_s  
        end
      end 
    end 
  end
  output_hash
end

puts nyc_pigeon_organizer(pigeon_data)

