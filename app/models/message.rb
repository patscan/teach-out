class Message < ActiveRecord::Base
  attr_accessible :content, :delivered, :header, :time_sent
  belongs_to :teacher
end
