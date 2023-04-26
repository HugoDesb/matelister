class InviteMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invite_mailer.submitted.subject
  #
  def submitted(invite)

    @invite = invite

    mail to: invite.email, subject: "New invitation on Matelist!"
  end
end
