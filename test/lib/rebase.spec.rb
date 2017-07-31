require 'test_helper'
# require 'minitest/autorun'
require_relative '../../lib/rebase.rb'

class TestRebase < ActiveSupport::TestCase
  test "should encode decimal number into 62 based string by default" do 
    assert_equal '0', Rebase.encode(0)
    assert_equal '1', Rebase.encode(1)
    assert_equal 'Z', Rebase.encode(61)
    assert_equal '10', Rebase.encode(62)
    assert_equal '100', Rebase.encode(62 * 62)
    assert_equal 'ZZ', Rebase.encode(62 * 61 + 61)
    assert_equal 'ZZZ', Rebase.encode(62 * 62 * 61 + 62 * 61 + 61)
    assert_equal '1aB', Rebase.encode(62 * 62 * 1 + 62 * 10 + 37)
  end

  test "should decode xcimal string into decimal number by default" do
    assert_equal 0, Rebase.decode('0')
    assert_equal 1, Rebase.decode('1')
    assert_equal 61, Rebase.decode('Z')
    assert_equal 62, Rebase.decode('10')
    assert_equal 62 * 62, Rebase.decode('100')
    assert_equal 62 * 61 + 61, Rebase.decode('ZZ')
    assert_equal 62 * 62 * 61 + 62 * 61 + 61, Rebase.decode('ZZZ')
    assert_equal 62 * 62 * 1 + 62 * 10 + 37, Rebase.decode('1aB')
  end
end