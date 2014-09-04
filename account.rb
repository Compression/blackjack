#define accounts
#report starting and ending balances
#summarize accounts
class Account

  attr_accessor :account, :starting_balance, :transactions
  def initialize(account, starting_balance)
    @account = account
    @starting_balance = starting_balance
    @current_balance = 0.0
    @transactions = []

  end

  def get_current_balance

    @current_balance = @starting_balance.to_f

    @transactions.each do |tranny|
      @current_balance += tranny.amount.to_f
    end

    @current_balance
  end

  def summary

    puts "#{@account}\n\n Starting Balance:#{@starting_balance}\n\n Ending Balance:#{get_current_balance}\n\n"

     @transactions.each do |x|
        puts x.summary
      end

  end

  def get_transaction

    CSV.foreach('bank_data.csv', headers: true) do |row|
      if row['Account'] == @account
        @transactions << Transaction.new(row['Date'], row['Amount'], row['Description'], row['Account'])
      end
    end

    end


end
