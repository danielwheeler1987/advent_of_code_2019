text_data = File.open('data.txt').read
modules = text_data.split("\n")
                   .map(&:to_i)

def calculate_fuel(mass, recursive)
  return 0 if mass < 7
  fuel_mass = (mass / 3).floor - 2
  fuel_mass += calculate_fuel(fuel_mass, recursive: recursive) if recursive
  fuel_mass
end

# Part 1
result_part_1 = modules.map { |mass| calculate_fuel(mass, false) }
                       .inject(&:+)
puts "Part 1 answer: #{result_part_1}\n" # The answer is 3147032

# Part 2
result_part_2 = modules.map { |mass| calculate_fuel(mass, true) }
                       .inject(&:+)
puts "Part 2 answer: #{result_part_2}\n" # The answer is 4717699
