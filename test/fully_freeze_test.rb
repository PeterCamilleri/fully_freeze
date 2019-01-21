require_relative '../lib/fully_freeze'
gem              'minitest'
require          'minitest/autorun'
require          'minitest_visible'

class LoremIpsum

  attr_accessor :a
  attr_accessor :b
  attr_accessor :c

  def initialize(a,b,c)
    @a, @b, @c = a,b,c
  end

end

class FullyFreezeTest < Minitest::Test

  #Track mini-test progress.
  include MinitestVisible

  def test_that_it_has_a_version_number
    refute_nil ::FullyFreeze::VERSION
    assert(::FullyFreeze::VERSION.frozen?)
    assert(::FullyFreeze::VERSION.is_a?(String))
    assert(/\A\d+\.\d+\.\d+/ =~ ::FullyFreeze::VERSION)
  end

  def test_that_it_has_a_description
    refute_nil(::FullyFreeze::DESCRIPTION)
    assert(::FullyFreeze::DESCRIPTION.frozen?)
    assert(::FullyFreeze::DESCRIPTION.is_a?(String))
  end

  def test_for_simple_cases
    assert(42.fully_freeze.frozen?)
    assert(42.fully_freeze.fully_frozen?)

    assert(42.0.fully_freeze.frozen?)
    assert(42.0.fully_freeze.fully_frozen?)

    assert(true.fully_freeze.frozen?)
    assert(true.fully_freeze.fully_frozen?)

    assert(false.fully_freeze.frozen?)
    assert(false.fully_freeze.fully_frozen?)

    assert(:false.fully_freeze.frozen?)
    assert(:false.fully_freeze.fully_frozen?)
  end

  def test_for_mutable_cases
    assert("42".fully_freeze.frozen?)
    assert("42".fully_freeze.fully_frozen?)

    assert((1..42).fully_freeze.frozen?)
    assert((1..42).fully_freeze.fully_frozen?)

    assert((1..42).each.fully_freeze.frozen?)
    assert((1..42).each.fully_freeze.fully_frozen?)

    assert((/./.match("k")).fully_freeze.frozen?)
    assert((/./.match("k")).fully_freeze.fully_frozen?)

    assert((Thread.new {}).fully_freeze.frozen?)
    assert((Thread.new {}).fully_freeze.fully_frozen?)

    assert((Thread.new {}).fully_freeze.frozen?)
    assert((Thread.new {}).fully_freeze.fully_frozen?)

    assert(Complex(1,1).fully_freeze.frozen?)
    assert(Complex(1,1).fully_freeze.fully_frozen?)

    assert(Rational(1,1).fully_freeze.frozen?)
    assert(Rational(1,1).fully_freeze.fully_frozen?)
  end

  def test_for_arrays
    assert((1..42).to_a.fully_freeze.frozen?)
    assert((1..42).to_a.fully_freeze.fully_frozen?)

    assert([1,2,[3,Complex(4,5)]].fully_freeze.frozen?)
    assert([1,2,[3,Complex(4,5)]].fully_freeze.fully_frozen?)

    evil = [1,2,nil,3,4]
    evil[2] = evil
    assert_equal(evil.object_id, evil[2].object_id)

    assert(evil.fully_freeze.frozen?)
    assert(evil.fully_frozen?)
  end

  def test_for_hash_now_legal_in_Canada
    nice = {"a" => "b", "c" => "d", "e" => "f", "g" => 99}

    assert(nice.fully_freeze.frozen?)
    assert(nice.fully_frozen?)

    evil = {"a" => "b", "c" => "d", "e" => "f", "g" => 99}
    evil["evil"] = evil
    assert_equal(evil.object_id, evil["evil"].object_id)

    assert(evil.fully_freeze.frozen?)
    assert(evil.fully_frozen?)
  end

  def test_with_common_objects
    sample = LoremIpsum.new("rr", Complex(1,2), [1,2,3])

    assert(sample.fully_freeze.frozen?)
    assert(sample.fully_frozen?)

    evil = LoremIpsum.new("rr", Complex(1,2), [1,2,3])
    evil.b = sample

    assert(evil.fully_freeze.frozen?)
    assert(evil.fully_frozen?)

    evil = LoremIpsum.new("rr", Complex(1,2), [1,2,3])
    evil.c[1] = sample

    assert(evil.fully_freeze.frozen?)
    assert(evil.fully_frozen?)
  end

end
