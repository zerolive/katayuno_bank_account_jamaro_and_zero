require_relative '../bank_account'

describe 'Bank Account' do
  it 'shows the balance' do
    balance = 'date || credit || balance'

    bank_account = BankAccount.new

    expect(bank_account.balance).to eq(balance)
  end

  it 'shows the balance with deposits' do
    balance = "date || credit || balance\n02/04/2014 || 500.00 || 1500.00\n01/04/2014 || 1000.00 || 1000.00"
    bank_account = BankAccount.new

    bank_account.deposit(date: '01/04/2014', credit: 1000.00)
    bank_account.deposit(date: '02/04/2014', credit: 500.00)

    expect(bank_account.balance).to eq(balance)
  end

  it 'shows the balance with withdraws' do
    balance = "date || credit || debit || balance\n03/04/2014 || 500.00 ||  || 1300.00\n02/04/2014 ||  || 200.00 || 800.00\n01/04/2014 || 1000.00 ||  || 1000.00"
    bank_account = BankAccount.new

    bank_account.deposit(date: '01/04/2014', credit: 1000.00)
    bank_account.withdraw(date: '02/04/2014', debit: 200.00)
    bank_account.deposit(date: '03/04/2014', credit: 500.00)

    expect(bank_account.balance).to eq(balance)
  end
end
