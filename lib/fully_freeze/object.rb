# coding: utf-8

# Add fully_freeze support to the object class.
class Object

  # Do fully_freeze the object.
  def fully_freeze(progress={})
    progress[object_id] = freeze

    instance_variables.each do |name|
      value = instance_variable_get(name)
      value.fully_freeze(progress) unless progress[value.object_id]
    end

    self
  end

  # Is this object fully_frozen?
  def fully_frozen?(progress={})
    return false unless frozen?

    progress[object_id] = self

    instance_variables.each do |name|
      value = instance_variable_get(name)
      return false unless progress[value.object_id] || value.fully_frozen?(progress)
    end

    true
  end

end
