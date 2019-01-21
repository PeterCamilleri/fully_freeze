# coding: utf-8

# Add fully_freeze support to the struct class.
class Struct

  # Do fully_freeze the struct.
  def fully_freeze(progress={})
    progress[object_id] = freeze

    members.each do |name|
      value = self[name]
      value.fully_freeze(progress) unless progress[value.object_id]
    end

    self
  end

  # Is this struct fully_frozen?
  def fully_frozen?(progress={})
    return false unless frozen?

    progress[object_id] = self

    members.each do |name|
      value = self[name]
      return false unless progress[value.object_id] || value.fully_frozen?(progress)
    end

    true
  end


end
