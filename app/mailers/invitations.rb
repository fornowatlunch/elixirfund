class Invitations < ActionMailer::Base
  default from: "meg@elixirfund.org"

  def invite(invitation, invitor)
    @invitation = invitation
    @invitor = invitor

    mail to: @invitation.to, subject: "Elixir Fund invitation"
  end
end
