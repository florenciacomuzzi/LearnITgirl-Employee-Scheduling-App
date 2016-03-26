class Client < ActiveRecord::Base
    has_many :contracts
    #validates :name, presence: true
end


client = Client.new
user.save # => false
user.save! # => ActiveRecord::RecordInvalid: Validation failed: Name can't be blank
