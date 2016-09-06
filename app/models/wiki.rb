class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators

  scope :visible_to, -> (user) { user && (user.admin? || user.premium?) ? all : where(private: false) }

  def collaborator?(user)
    collaborators.where(user_id: user.id).first
  end
end
