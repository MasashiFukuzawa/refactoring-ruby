# Before
class Employee
  NULL_EXPENSE = -1.0

  def initialize
    @expense_limit = NULL_EXPENSE
  end

  def expense_limit
    (@expense_limit != NULL_EXPENSE) ?
      @expense_limit : @primary_project.member_expense_limit
  end

  def within_limit(expense_amount)
    expense_amount <= expense_limit
  end
end

# After
class Employee
  include Assertion

  NULL_EXPENSE = -1.0

  def initialize
    @expense_limit = NULL_EXPENSE
  end

  def expense_limit
    assert { @expense_limit != NULL_EXPENSE || !@primary_project.nil? }

    (@expense_limit != NULL_EXPENSE) ?
      @expense_limit : @primary_project.member_expense_limit
  end

  def within_limit(expense_amount)
    expense_amount <= expense_limit
  end
end

module Assertion
  class AssertionFailedError < StandardError; end

  def assert(&condition)
    raise AssertionFailedError.new('Assertion Failed') unless condition.call
  end
end
