class ParticipantsController < ApplicationController

  def new
    @participant = Participant.new
  end

  def create
    respond_with @participant
  end

  def show

  end

  def roll
    all_participants = Participant.all
    @participant = all_participants.sample
  end

end