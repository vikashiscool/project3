class Technology < ActiveRecord::Base


has_many :videos, dependent: :destroy
has_many :user
belongs_to :user

end
