module Enumerable
 def my_each_with_index
  i = 0
  while i < self.length
    yield(self[i],i)
      i += 1
    end
  return self
 end

  def my_select
    selected = []
    my_each do |element|
      if yield(element) == true
        selected.push(element)
      end
    end
    return selected
  end

  def my_all?
    my_each do |element|
      if yield(element) == false
        return false
      end
    end
    true
  end

  def my_any?
    my_each do |element|
      if yield(element) == true
        return true
      end
    end
    false
  end

  def my_none?
    my_each do |element|
      if yield(element) == true
        return false
      end
    end
    true
  end

  def my_count
    if block_given?
      number = 0
      my_each do |element|
        if yield(element) == true
          number += 1
        end
      end
      return number
    else
      return self.length
    end
  end

  def my_map
    new_array = []
    my_each do |element|
      new_array.push(yield(element))
    end
    new_array
  end

  def my_inject(initial_value = nil)
    accumulator = initial_value
    my_each do |element|
      accumulator = yield(accumulator, element)
    end
    accumulator
  end


end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end
    return self
  end
end
