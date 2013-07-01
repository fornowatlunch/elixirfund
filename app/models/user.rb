class User < ActiveRecord::Base
  has_one :patient
  has_many :connections
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :confirmable, :database_authenticatable, :registerable,
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

  protected
  
  def make_connections
    if !session[:invite_token].blank?
      invitation = Invitation.find_by_token(session[:token])
      invitor = User.find(invitation.invitor_id) 
      Connection.create! :user => self, :to_user => invitor.id
      Connection.create! :user => invitor, :to_user => self
    end
  end
    
end
