class Fixnum

  def in_words
    return "zero" if num == 0
    str = []
    digits = ["", "thousand", "million", "billion", "trillion"]
    num_splits = self.to_s.reverse.split('').each_slice(3).to_a #splits num into groups of three, in reverse
    num_splits = num_splits.map(&:reverse).map(&:join).map(&:to_i) #joins properly ordered groups, converts to int
    num_splits.each_with_index { |x,v| str << hundreds(x) + " " + digits[v] } #includes digits (thousand, million)
    str.reverse.join(" ").strip

  end

  def hundreds(num)
    words_hash = { 1=>"one", 2=>"two", 3=>"three", 4=>"four", 5=>"five",
      6=>"six", 7=>"seven", 8=>"eight", 9=>"nine",
      10=>"ten",11=>"eleven",12=>"twelve",
      13=>"thirteen", 14=>"fourteen", 15=>"fifteen", 16=>"sixteen",
      17=>"seventeen", 18=>"eighteen", 19=>"nineteen",
      20=>"twenty", 30=>"thirty", 40=>"forty", 50=>"fifty",
      60=>"sixty", 70=>"seventy", 80=>"eighty", 90=>"ninety"
    }
    result = []
    arr = num.to_s.split("")

    num.to_s.split("").each do |dig|
      if arr.length == 1
        result << words_hash[dig.to_i]
      elsif arr.length == 2 && words_hash.include?((dig + arr.last).to_i)
        result << words_hash[(dig + arr.last).to_i]
        break
      elsif arr.length == 2
        result << words_hash[(dig + "0").to_i]
      else
        result << words_hash[dig.to_i] + " hundred"
      end
      arr.shift
    end
    result.join(" ")
  end

end