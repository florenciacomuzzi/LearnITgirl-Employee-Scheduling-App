class Client < ActiveRecord::Base
    has_many :contracts
    #validates :name, presence: true

end

