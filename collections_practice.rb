require 'pry'
def begins_with_r(array)
  if array.all? {|word| word.start_with?("r")}
    true
  else
    false
  end
end

def contain_a(array)
  array.select { |str| str.include?('a') }
end

def first_wa(array)
  words = array.select {|word| word.to_s.include?("wa")}
  words[0] if words
end

def remove_non_strings(array)
  array.delete_if { |obj| !(obj.is_a? String) }
end

def count_elements(array)
  array.group_by(&:itself)
   .map{|name, times| name.merge(count: times.length)}
 end

def merge_data(array, data)
  new_array = []
  array.each do |first_hash|
    name = first_hash[:first_name]
    data.each do |second_hash|  #name = "blake"
      if second_hash[name]
         merged_data = second_hash[name]
         merged_data[:first_name] = name
         new_array << merged_data
       end
     end
   end
   new_array
 end 

def find_cool(array)
  new_array = []
  array.each do |hash|
    if hash.has_value?("cool")
      new_array << hash
    end
  end
  new_array
end

def organize_schools(array)
  organized = {}
  array.each do |name, hash|
    place = hash[:location]
    if organized[place] #if it exists
       organized[place] << name
     else
       organized[place] = [] #adding a new key/value pair to organized
       organized[place] << name
     end
  end
  organized
end
