# your code goes here
def begins_with_r(array)
  counter = 0
  array.each do |element|
    if element[0] == "r"
      counter += 1
    end
  end
  if counter == array.size
    return true
  end
  return false
end

def contain_a(array)
  array.select do |element|
    element.include?("a")
  end
end

def first_wa(array)
  array.each do |element|
    if element[0] == "w" && element[1] == "a"
      return element
    end
  end
  return nil
end

def remove_non_strings(array)
  array.select do |element|
    element.is_a? String
  end
end

def count_elements(hash)
  name_array = []
  hash_array = []
  hash.each do |value|
    name_array << value[:name]
  end
  distinct_array = name_array.uniq
  distinct_array.each do |element|
    new_hash = Hash.new
    new_hash[:name] = element
    new_hash[:count] = name_array.count(element)
    hash_array << new_hash
  end
  return hash_array
end

def merge_data (keys, data)
  name_array = []
  hash_array = []

  keys.each do |key|
    name_array << key[:first_name]
  end
  name_array.each do |name|
    hash = Hash.new
    hash[:first_name] = name
    hash[:awesomeness] = data[0][name][:awesomeness]
    hash[:height] = data[0][name][:height]
    hash[:last_name] = data[0][name][:last_name]
    hash_array << hash
  end
  return hash_array
end

def find_cool(hash)
  array = []
  hash.each do |layer|
    if layer[:temperature] == "cool"
      array << layer
    end
  end
  return array
end

def organize_schools(schools)
  location_array = []
  school_list = []
  schools_array = schools.flatten
  location_hash = Hash.new
  schools_array.each do |item|
    if item.is_a? String
      location_array << schools_array[schools_array.index(item)+1][:location]
      school_list << item
    end
  end
  uniq_location_array = location_array.uniq
  uniq_location_array.each do |location|
    location_hash.store(location,[])
  end
  counter = 0
  location_array.each do |location|
    location_hash[location] << school_list[counter]
    counter += 1
  end
  return location_hash
end
