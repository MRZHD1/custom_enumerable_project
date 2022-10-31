module Enumerable
  def my_each_with_index
    i = 0
    for element in self
      yield element, i
      i += 1
    end
    return self
  end

  def my_count(&blck)
    i = 0
    for element in self
      if block_given?
        if blck.call(element)
          i += 1
        end
      else
        i += 1
      end
    end
    return i
  end

  def my_inject(val, &blck)
    for element in self
      val = blck.call(val, element)
    end
    val
  end

  def my_all?(&blck)
    val = true
    for element in self
      unless blck.call(element)
        val = false
      end
    end
    val
  end

  def my_any?(&blck)
    val = false
    for element in self
      if blck.call(element)
        val = true
      end
    end
    val
  end

  def my_none?(&blck)
    val = true
    for element in self
      if blck.call(element)
        val = false
      end
    end
    val
  end

  def my_map(&blck)
    new_arr = []
    for element in self
      new_arr.push(blck.call(element))
    end
    return new_arr
  end

  def my_select(&blck)
    new_arr = []
    for element in self
      if blck.call(element)
        new_arr.push(element)
      end
    end
    new_arr
  end
end

class Array
  def my_each(&blck)
    for element in self
      yield element
    end
    self
  end
end
