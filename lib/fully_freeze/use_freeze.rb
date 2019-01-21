# coding: utf-8

# The mixin for classes where freeze is just simple freeze.
module FullyFreezeFreeze
  def fully_freeze(_progress=nil)
    freeze
  end

  def fully_frozen?(_progress=nil)
    frozen?
  end
end

# Strings answer freeze.
class String
  include FullyFreezeFreeze
end

# Ranges answer freeze.
class Range
  include FullyFreezeFreeze
end

# Enumerators answer freeze.
class Enumerator
  include FullyFreezeFreeze
end

# MatchData answer freeze.
class MatchData
  include FullyFreezeFreeze
end

# Regular expressions answer freeze.
class Regexp
  include FullyFreezeFreeze
end

# Threads answer freeze.
class Thread
  include FullyFreezeFreeze
end

# Complex are an exception, they answer freeze.
class Complex
  include FullyFreezeFreeze
end

# Rational are an exception, they answer freeze.
class Rational
  include FullyFreezeFreeze
end
