# coding: utf-8

# A mixin for classes where the freeze is the object itself.
module FullyFreezeSelf
  def fully_freeze(_progress=nil)
    self
  end

  def fully_frozen?(_progress=nil)
    true
  end
end

# By default, Numerics answer self.
class Numeric
  include FullyFreezeSelf
end

# NilClass objects (nil) answer self.
class NilClass
  include FullyFreezeSelf
end

# TrueClass objects (true) answer self.
class TrueClass
  include FullyFreezeSelf
end

# FalseClass objects (false) answer self.
class FalseClass
  include FullyFreezeSelf
end

# Symbols answer self.
class Symbol
  include FullyFreezeSelf
end
