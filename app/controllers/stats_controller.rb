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

  def team_leaders
    @player_ids = Statline.distinct.pluck(:player_id)
    @hit_totals = {}
    @batting_avg_totals = {}
    @run_totals = {}
    @rbi_totals = {}
    @single_totals = {}
    @double_totals = {}
    @triple_totals = {}
    @homerun_totals = {}
    @stolen_base_totals = {} 
    @strikeout_totals = {}

    @inning_totals = {}
    @hits_allowed_totals = {}
    @walks_allowed_totals = {}
    @er_totals = {}
    @pitching_strikeout_totals = {}
    @win_total = {}
    @save_total = {}

    @player_ids.each do |id|
      @hits = Statline.where("player_id = #{id}").sum(:hits)
      @at_bats = Statline.where("player_id = #{id}").sum(:abs) 
      @runs = Statline.where("player_id = #{id}").sum(:runs) 
      @walks = Statline.where("player_id = #{id}").sum(:walks) 
      @rbis = Statline.where("player_id = #{id}").sum(:rbis) 
      @stolen_bases = Statline.where("player_id = #{id}").sum(:stolen_bases) 
      @singles = Statline.where("player_id = #{id}").sum(:singles) 
      @doubles = Statline.where("player_id = #{id}").sum(:doubles) 
      @triples = Statline.where("player_id = #{id}").sum(:triples) 
      @homeruns = Statline.where("player_id = #{id}").sum(:homeruns) 
      @strikeouts = Statline.where("player_id = #{id}").sum(:strikeouts)

      @innings = Statline.where("player_id = #{id}").sum(:innings)
      @hits_allowed = Statline.where("player_id = #{id}").sum(:hits_allowed)
      @walks_allowed = Statline.where("player_id = #{id}").sum(:walks_allowed)
      @ers = Statline.where("player_id = #{id}").sum(:ers)
      @pitching_strikeouts = Statline.where("player_id = #{id}").sum(:pitching_strikeouts)
      @wins = Statline.where("player_id = #{id}").sum(:win)
      @saves = Statline.where("player_id = #{id}").sum(:save_game)

      @hit_totals[id] = @hits
     
      if @at_bats.to_f != 0.0
        @batting_avg_totals[id] = @hits.to_f / @at_bats.to_f
      end
 
      @run_totals[id] = @runs
      @rbi_totals[id] = @rbis
      @single_totals[id] = @singles
      @double_totals[id] = @doubles
      @triple_totals[id] = @triples
      @homerun_totals[id] = @homeruns
      @stolen_base_totals[id] = @stolen_bases
      @strikeout_totals[id] = @strikeouts

      @inning_totals[id] = @innings
      @hits_allowed_totals[id] = @hits_allowed
      @walks_allowed_totals[id] = @walks_allowed
      @er_totals[id] = @ers
      @pitching_strikeout_totals[id] = @pitching_strikeouts
      @win_total[id] = @wins
      @save_total[id] = @saves
    end

    @hit_leaders = @hit_totals.values.sort { |x, y| y <=> x}
    @avg_leaders = @batting_avg_totals.values.sort { |x, y| y <=> x}
    @run_leaders = @run_totals.values.sort { |x, y| y <=> x}
    @rbi_leaders = @rbi_totals.values.sort { |x, y| y <=> x}
    @single_leaders = @single_totals.values.sort { |x, y| y <=> x}
    @double_leaders = @double_totals.values.sort { |x, y| y <=> x}
    @triple_leaders = @triple_totals.values.sort { |x, y| y <=> x}
    @homerun_leaders = @homerun_totals.values.sort { |x, y| y <=> x}
    @stolen_base_leaders = @stolen_base_totals.values.sort { |x, y| y <=> x}
    @strikeout_leaders = @strikeout_totals.values.sort { |x, y| y <=> x}

    @inning_leaders = @inning_totals.values.sort { |x, y| y <=> x}
    @hits_allowed_leaders = @hits_allowed_totals.values.sort { |x, y| y <=> x}
    @walks_allowed_leaders = @walks_allowed_totals.values.sort { |x, y| y <=> x}
    @er_leaders = @er_totals.values.sort { |x, y| y <=> x}
    @pitching_strikeout_leaders = @pitching_strikeout_totals.values.sort { |x, y| y <=> x}
    @win_leaders = @win_total.values.sort { |x, y| y <=> x}
    @save_leaders = @save_total.values.sort { |x, y| y <=> x}

  end
end


