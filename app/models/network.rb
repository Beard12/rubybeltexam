class Network < ActiveRecord::Base
  belongs_to :user, :foreign_key => "user_id", :class_name => "User"
  belongs_to :networkee, :foreign_key => "networkee_id", :class_name =>"User"
end
