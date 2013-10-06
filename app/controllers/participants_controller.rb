class ParticipantsController < ApplicationController

  respond_to :html

  http_basic_authenticate_with name: "iic", password: "1234", only: :roll

  def new
    @participant = Participant.new
  end

  def create
    @participant = Participant.new(participant_params)
    if @participant.valid?
      @participant.save
      flash[:notice] = "You successfully signed up - Awesome"
      redirect_to root_path
    else
      flash[:error] = @participant.errors.full_messages.first
      redirect_to new_participant_path
    end
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