class RosterController < ApplicationController
  def index
		@players = Player.all.order(:jersey_number)
  end
end
