class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :wikis
  after_initialize :check_role

  enum role: [:standard, :premium, :admin]

  def check_role
    self.role ||= :standard
  end
end
