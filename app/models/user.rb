class User < ActiveRecord::Base
  has_one :patient
  has_many :connections
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  def connected_to(user)
    connections.where(:to_user => user.id).any?
  end

  def patient?
    !patient.nil?
  end
end
