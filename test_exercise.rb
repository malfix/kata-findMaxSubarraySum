require_relative "exercise"
require "test/unit"

class TestExercise < Test::Unit::TestCase
  setup 'init' do
    @ex = Exercise.new
  end

  test 'base example' do
    assert_equal 15, @ex.find(8, -1, 3, 4)
  end

  test 'base example 2' do
    assert_equal 6, @ex.find(-4, 5, 1, 0)
  end

  test 'lower range in the middle' do
    assert_equal 3, @ex.find(-4, 5, 1, -2, -2, -2, 1)
  end

  test 'lower range at bounduary' do
    assert_equal 4, @ex.find(-4, 5, 1, -2, -2, 2, -1)
  end

  test 'no lower range' do
    assert_equal 2, @ex.find(1, 1)
  end

  test 'one element' do
    assert_equal 1, @ex.find(1)
  end

  test 'compress_and_find_localmin' do
    assert_equal([-4, -1, [-4, 6, -4, 2, -1]], @ex.get_localmin_total_and_compressed_list(-4, 5, 1, -2, -2, 2, -1))
  end

  test 'compress_and_find_localmin 2' do
    assert_equal([-1, 14, [8, -1, 7]], @ex.get_localmin_total_and_compressed_list(8, -1, 3, 4))
  end
end
