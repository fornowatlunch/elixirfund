class Invitations < ActionMailer::Base
  default from: "noreply@elixirfund.com"

  def invite(invitation, invitor)
    @invitation = invitation
    @invitor = invitor

    mail to: @invitation.to
  end
end
