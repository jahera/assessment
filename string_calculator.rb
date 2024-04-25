class StringCalculator
  def self.add(numbers) 
    return 0 if numbers.empty? 
    match = numbers.match(/^\/\/(\[?.+?\]?)\n(.+)/)

    if match 
    	delimiter = Regexp.escape(match[1]) 
      numbers = match[2] 
    else 
    	delimiter = ",|\n" 
    end 

    #Splitting by the specified delimiter and converting each substring to an integer 
    parsed_numbers = numbers.split(/#{delimiter}/).map(&:to_i) 

    #Check for negative numbers and raise an exception if found 
    negatives = parsed_numbers.select { |num| num < 0 } 
    if negatives.any? 
      raise "negative numbers not allowed #{negatives.join(",")}" 
    end 
    parsed_numbers.sum 
  end
end

begin
  puts StringCalculator::add("")
  puts StringCalculator::add("1")
  puts StringCalculator::add("1\n2,3")
  puts StringCalculator::add("10\n20\n30")
  puts StringCalculator::add("//;\n4;6")
  puts StringCalculator::add("//;\n-4;6")
rescue => e
  puts "Exception: #{e.message}"
end