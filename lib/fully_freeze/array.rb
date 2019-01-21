# coding: utf-8

# Add fully_freeze support to the array class.
class Array

  # Do fully_freeze the array.
  def fully_freeze(progress={})
    progress[object_id] = freeze

    each do |value|
      value.fully_freeze(progress) unless progress[value.object_id]
    end

    self
  end

  # Is this array fully_frozen?
  def fully_frozen?(progress={})
    return false unless frozen?

    progress[object_id] = self

    each do |value|
      return false unless progress[value.object_id] || value.fully_frozen?(progress)
    end

    true
  end

end
