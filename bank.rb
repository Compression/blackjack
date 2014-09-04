#pull CSV data
#initialize individual accounts
#initialize individual transactions
#print data


require 'csv'
require 'pry'
require_relative 'account'
require_relative 'transactions'



acct_holder = []

CSV.foreach('balances.csv', headers: true) do |row|
  acct_holder << Account.new(row['Account'],row['Balance'])
end




acct_holder.each do |acct|
  acct.get_transaction
  acct.summary
end
