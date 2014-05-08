def selection_sort(ar)
  
  n = ar.size - 1

  n.times do |i|
    index_min = i

    (i + 1).upto(n) do |j|
      index_min = j if ar[j] < ar[index_min]
    end

  ar[i], ar[index_min] = ar[index_min], ar[i] if index_min != i
  end
  ar
end