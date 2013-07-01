class Invitation < ActiveRecord::Base
  belongs_to :invitor, :class_name => 'User'
  belongs_to :invitee, :class_name => 'User'
  attr_accessible :message, :subject, :to, :token, :invitor_id, :invitee_id

  before_create :generate_token

  protected

  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless Invitation.where(token: random_token).exists?
    end
  end

end
