require_relative '../lib/fully_freeze'
gem              'minitest'
require          'minitest/autorun'
require          'minitest_visible'

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



end
