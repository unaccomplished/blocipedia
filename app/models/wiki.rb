class Wiki < ActiveRecord::Base
  belongs_to :user

  scope :visible_to, -> (user) { user && (user.admin? || user.premium?) ? all : where(private: false) }
end
