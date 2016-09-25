require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  test 'minor student' do
    bill = Student.find_by_name('bill')
    assert_equal bill.major?, false
  end
  test 'major student' do
    joe = Student.find_by_name('joe')
    assert_equal joe.major?, true
  end

end
