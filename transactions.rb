#check transaction data for state (deposit or withdrawal)

class Transaction
  attr_reader :amount, :date, :description, :account
  def initialize(date, amount, description, account)
    @date = date
    @amount = amount
    @description = description
    @account = account
  end

  def deposit?
    if @amount.to_f < 0
      false
    else
      true
    end
  end

  def summary
    puts "#{@amount},  #{deposit? ? 'DEPOSIT' : 'WITHDRAWAL'},  #{@date},  #{description} "
  end
end
