def insertion_sort(ar)
  arr = ar.dup
    for i in 1..(arr.length-1) do
      n = i
      while n >= 1 && arr[n] < arr[n - 1] do
        if arr[n] < arr[n - 1]
          tmp = arr[n]
          arr[n] = arr[n - 1]
          arr[n - 1] = tmp
        end
        n -= 1
      end
    end
    arr
end