class StatsController < ApplicationController
  def index
  end

  def player_stats
    if params[:player_id] == nil
      @player = nil
    else
      @player = true
      @player_name = Player.find(params[:player_id])
      @player_stats = Statline.where("player_id = '#{params[:player_id]}'").order(:game_id)
    end
  end

  def team_stats
    @games = Game.all 
  end
end
