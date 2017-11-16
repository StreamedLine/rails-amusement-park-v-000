class User < ActiveRecord::Base
	has_secure_password

	has_many :rides
	has_many :attractions, :through => :rides

    validates :name, :happiness, :nausea, :height, :tickets, presence: true
    
    def mood
    	if nausea > happiness
    		"sad"
    	else
    		"happy"
    	end
    end
end
