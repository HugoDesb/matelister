# frozen_string_literal: true

class InvitesController < ApplicationController
  before_action :set_matelist
  def new
    @invite = Invite.new
  end

  def create
    invite = @matelist.invites.create! invite_params
    InviteMailer.submitted(invite).deliver_later
    redirect_to @matelist
  end

  private

  def set_matelist
    @matelist = Matelist.find(params[:matelist_id])
  end

  # Only allow a list of trusted parameters through.
  def invite_params
    params.require(:invite).permit(:email)
  end
end
