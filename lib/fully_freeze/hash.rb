# coding: utf-8

# Add fully_freeze support to the hash class.
class Hash

  # Do fully_freeze the hash.
  def fully_freeze(progress={})
    progress[object_id] = freeze

    each_pair do |key, value|
      key.fully_freeze(progress)   unless progress[key.object_id]
      value.fully_freeze(progress) unless progress[value.object_id]
    end

    self
  end

  # Is this hash fully_frozen?
  def fully_frozen?(progress={})
    return false unless frozen?

    progress[object_id] = self

    each_pair do |key, value|
      return false unless progress[key.object_id]   || key.fully_frozen?(progress)
      return false unless progress[value.object_id] || value.fully_frozen?(progress)
    end

    true
  end

end
