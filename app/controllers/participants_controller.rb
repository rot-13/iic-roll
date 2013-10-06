class ParticipantsController < ApplicationController

  respond_to :html

  def new
    @participant = Participant.new
  end

  def create
    @participant = Participant.create(participant_params)
    redirect_to root_path
  end

  def show

  end

  def roll
    all_participants = Participant.all
    @participant = all_participants.sample
    @participant.update_attributes(rolled: true)
  end

  private

  def participant_params
    params.require(:participant).permit(:full_name, :company, :email, :something_funny)
  end

end