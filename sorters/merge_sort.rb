def merge_sort(array)

  return array if array.length <= 1

  middle = array.length / 2
  left = merge_sort(array[0...middle])
  right = merge_sort(array[middle..-1])

  merge_helper(left, right)
end

def merge_helper(array1, array2)
  merged = []

  while !(array1.empty?) || !(array2.empty?)
    if array1.length > 0 && array2.length > 0
      if array1.first <= array2.first
        merged << array1.shift
      else
        merged << array2.shift
      end
    elsif array1.length > 0
      merged << array1.shift
    elsif array2.length > 0
      merged << array2.shift
    end
  end

  merged
end