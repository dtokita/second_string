class DataEntryController < ApplicationController
  http_basic_authenticate_with :name => "dtokita", :password => "password"
  skip_before_action :verify_authenticity_token  

  def index
  end

  def create_player
  end

  def create_player_post
    render(:action => 'create_player')
    @player = Player.new
    @player.name = params[:player][:name]
    @player.jersey_number = params[:player][:jersey_number]
    @player.height = params[:player][:height]
    @player.weight = params[:player][:weight]
    @player.throws = params[:player][:throws]
    @player.bats = params[:player][:bats]
    @player.save
  end

  def edit_player
  end

  def edit_player_post
    render(:action => 'edit_player')
    @player = Player.find_by(name: params[:player][:name])
    @player.name = params[:player][:name]
    @player.jersey_number = params[:player][:jersey_number]
    @player.height = params[:player][:height]
    @player.weight = params[:player][:weight]
    @player.throws = params[:player][:throws]
    @player.bats = params[:player][:bats]
    @player.save
  end

  def create_game
  end

  def create_game_post
    render(:action => 'create_game')
    @game = Game.new
    @game.home_team = params[:game][:home_team]
    @game.away_team = params[:game][:away_team]
    @game.home_runs = params[:game][:home_runs]
    @game.away_runs = params[:game][:away_runs]
    @game.home_hits = params[:game][:home_hits]
    @game.away_hits = params[:game][:away_hits]
    @game.home_errors = params[:game][:home_errors]
    @game.away_errors = params[:game][:away_errors]
    @game.home = params[:game][:home]
    @game.win = params[:game][:win]
    @game.season = params[:game][:season]
    @game.playoff = params[:game][:playoff]
    @game.date = params[:game][:date]
    @game.time = params[:game][:time]
    @game.save
  end

  def create_statline
  end

  def create_statline_post
    render(:action => 'create_statline')
    
    # Offensive Stats
    @statline = Statline.new
    @statline.player_id = params[:stats][:player_id]
    @statline.game_id = params[:stats][:game_id]
    @statline.pas = params[:stats][:pas]
    @statline.abs = params[:stats][:abs]
    @statline.hits = params[:stats][:hits]
    @statline.runs = params[:stats][:runs]
    @statline.rbis = params[:stats][:rbis]
    @statline.singles = params[:stats][:singles]
    @statline.doubles = params[:stats][:doubles]
    @statline.triples = params[:stats][:triples]
    @statline.homeruns = params[:stats][:homeruns]
    @statline.stolen_bases = params[:stats][:stolen_bases]
    @statline.caught_stealing = params[:stats][:caught_stealing]
    @statline.walks = params[:stats][:walks]
    @statline.hbps = params[:stats][:hbps]
    @statline.gidp = params[:stats][:gidp]
    @statline.sac_bunts = params[:stats][:sac_bunts]
    @statline.sac_flies = params[:stats][:sac_flies]
    @statline.strikeouts = params[:stats][:strikeouts]

    # Pitching Stats
    @statline.walks_allowed = params[:stats][:walks_allowed]
    @statline.ers = params[:stats][:ers]
    @statline.hits_allowed = params[:stats][:hits_allowed]
    @statline.innings = params[:stats][:innings]
    @statline.pitching_strikeouts = params[:stats][:innings]
    @statline.win = params[:stats][:win]
    @statline.save_game = params[:stats][:save_game]
    @statline.loss = params[:stats][:loss]

    @statline.save
  end
end
