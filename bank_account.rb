
class BankAccount
  def initialize
    @movements = []
    @balance = 0
    @with_withdraws = false
  end

  def deposit(date:, credit:)
    @balance += credit
    @movements.unshift({ date: date, credit: credit, balance: @balance })
  end

  def withdraw(date:, debit:)
    @with_withdraws = true
    @balance -= debit
    @movements.unshift({ date: date, debit: debit, balance: @balance })
  end

  def balance
    return calculate_credits unless @with_withdraws

    calculate_debits
  end

  private

  def calculate_debits
    output = 'date || credit || debit || balance'
    @movements.each do |movement|
      output += "\n#{movement[:date]} || #{build(movement[:credit])} || #{build(movement[:debit])} || #{format(movement[:balance])}"
    end

    output
  end

  def calculate_credits
    output = 'date || credit || balance'
    @movements.each do |movement|
      output += "\n#{movement[:date]} || #{format(movement[:credit])} || #{format(movement[:balance])}"
    end

    output
  end

  def build(amount)
    return '' if amount.nil?

    format(amount)
  end

  def format(amount)
    '%.2f' % amount
  end
end
