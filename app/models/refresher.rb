class Refresher
  class << self
    
    def game_status
      @game = Game.all
      @time = Time.now+7200
    @game.each do |game|
      unless game.status === 'beendet'
        if game.gametime <= @time
          game.status = 'gestartet'
          game.save!
        end
      end
    end
    end
    
    def refresh_all
      refresh_groups
      refresh_gamers
      true
    end

    def refresh_groups
      refresh_games
      refresh_goals
      refresh_wins_and_losses
      refresh_place
    end

    def refresh_gamers
      @games = Game.finished
      @gamers = User.all

      @gamers.each do |gamer|
        gamer.points = 0
        @games.each do |game|
          @tipps = game.tipps
          @tipps.each do |tipp|
            if gamer == tipp.user
              gamer.points += calculate_points(game.goals_team_one, game.goals_team_two,
                                               tipp.goals_one, tipp.goals_two)
            end
          end
        end
        gamer.save!
      end
    end

    # Calculate the points for this tipp
    def calculate_points(game_goals_one, game_goals_two, goals_one, goals_two)
      # Nichts richtig
      points = 0
      #Tendenz und Tore richtig
      return points += 5 if game_goals_one == goals_one && game_goals_two == goals_two
      # Tendenz und Torverhältnis richtig
      return points += 3 if ((game_goals_one > game_goals_two && goals_one > goals_two) ||
                             (game_goals_one === game_goals_two && goals_one === goals_two) ||
                             (game_goals_one < game_goals_two && goals_one < goals_two)) &&
                             (game_goals_one - game_goals_two == goals_one - goals_two)
      # Nur Tendenz richtig
      return points += 1 if ((game_goals_one > game_goals_two && goals_one > goals_two) ||
              (game_goals_one < game_goals_two && goals_one < goals_two))
      points
    end

    # Amount of games per team is updated based on finished games
    def refresh_games
      @games = Game.finished
      @teams = Team.all

      @teams.each do |team|
        team.games = @games.where("team_one = ? or team_two = ?", team.id, team.id).where('round_id = ?', 1).size
        team.save!
      end
    end

    # Total number of goals per team is updated based on finished games
    def refresh_goals
      @games = Game.where('round_id = ?', 1).finished
      @teams = Team.all

      @teams.each do |team|
        goals_won = 0
        goals_lost = 0

        @games.where("team_one = ? or team_two = ?", team.id, team.id).each do |game|
          goals_won += game.goals_team_one if game.team_one == team
          goals_lost += game.goals_team_two if game.team_one == team
          goals_won += game.goals_team_two if game.team_two == team
          goals_lost += game.goals_team_one if game.team_two == team
        end
        team.goals = goals_won
        team.goals_allowed = goals_lost
        team.save!
      end
    end

    # Amount of games won per team is updated based on finished games
    def refresh_wins_and_losses
      @games = Game.finished.where('round_id = ?', 1)
      @teams = Team.all


      @teams.each do |team|
        wins = 0
        losses = 0
        draws = 0
        @games.where("team_one = ? or team_two = ?", team.id, team.id).each do |game|
          #puts "++++ game.winner_is.country = #{game.winner_is.country} ; team.country = #{team.country}"
          wins += 1 if game.winner_is == team
          losses += 1 if game.loser == team
          draws += 1 if game.is_draw?
        end
        team.wins = wins
        team.losses = losses
        team.draws = draws
        refresh_points(team)
        team.save!
      end
    end

    def refresh_points(team)
      team.points = team.wins * 3
      team.points += team.draws
    end
    
    def refresh_place
     @groups = Group.all
      @groups.each do |group|
        group.teams.each do |team|
          team.place = team.change_place(group.id)
          team.save!
        end
      end
    end
    
    def refresh_round
      setting = Setting.first.status
      achtelfinale = Round.find(2)
      viertelfinale = Round.find(3)
      halbfinale = Round.find(4)
      finale34 = Round.find(5)
      finale = Round.find(6)
      gruppe_a = Group.find(1)
      gruppe_b = Group.find(2)
      gruppe_c = Group.find(3)
      gruppe_d = Group.find(4)
      gruppe_e = Group.find(5)
      gruppe_f = Group.find(6)
      gruppe_g = Group.find(7)
      gruppe_h = Group.find(8)
      
    case setting
      when "Achtelfinale"
        #Spiele Achtelfinale
        game = Game.new( :gametime => '2018-06-30T20:00:00' )
        game.stadium = Stadium.find_by_city('Sotschi')
        game.team_one = gruppe_a.leader
        game.team_two = gruppe_b.second_leader
        game.save!

        achtelfinale.games << game

        game = Game.new( :gametime => '2018-06-30T16:00:00' )
        game.stadium = Stadium.find_by_city('Kasan')
        game.team_one = gruppe_c.leader
        game.team_two = gruppe_d.second_leader
        game.save!

        achtelfinale.games << game

        game = Game.new( :gametime => '2018-07-01T16:00:00' )
        game.stadium = Stadium.find_by_city('Moskau (Luschniki)')
        game.team_one = gruppe_b.leader
        game.team_two = gruppe_a.second_leader
        game.save!

        achtelfinale.games << game

        game = Game.new( :gametime => '2018-07-01T20:00:00' )
        game.stadium = Stadium.find_by_city('Nischni Nowgorod')
        game.team_one = gruppe_d.leader
        game.team_two = gruppe_c.second_leader
        game.save!

        achtelfinale.games << game

        game = Game.new( :gametime => '2018-07-02T16:00:00' )
        game.stadium = Stadium.find_by_city('Samara')
        game.team_one = gruppe_e.leader
        game.team_two = gruppe_f.second_leader
        game.save!

        achtelfinale.games << game

        game = Game.new( :gametime => '2018-07-02T20:00:00' )
        game.stadium = Stadium.find_by_city('Rostow am Don')
        game.team_one = gruppe_g.leader
        game.team_two = gruppe_h.second_leader
        game.save!

        achtelfinale.games << game

        game = Game.new( :gametime => '2018-07-03T16:00:00' )
        game.stadium = Stadium.find_by_city('Sankt Petersburg')
        game.team_one = gruppe_f.leader
        game.team_two = gruppe_e.second_leader
        game.save!

        achtelfinale.games << game

        game = Game.new( :gametime => '2018-07-03T20:00:00' )
        game.stadium = Stadium.find_by_city('Moskau (Spartak)')
        game.team_one = gruppe_h.leader
        game.team_two = gruppe_g.second_leader
        game.save!

        achtelfinale.games << game
      when "Viertelfinale"
        game = Game.new( :gametime => '2018-07-06T17:00:00' )
        game.stadium = Stadium.find_by_city('Nischni Nowgorod')
        game.team_one = achtelfinale.winner_game(49)
        game.team_two = achtelfinale.winner_game(50)
        game.save!

        viertelfinale.games << game

        game = Game.new( :gametime => '2018-07-06T21:00:00' )
        game.stadium = Stadium.find_by_city('Kasan')
        game.team_one = achtelfinale.winner_game(53)
        game.team_two = achtelfinale.winner_game(54)
        game.save!

        viertelfinale.games << game

        game = Game.new( :gametime => '2018-07-07T16:00:00' )
        game.stadium = Stadium.find_by_city('Samara')
        game.team_one = achtelfinale.winner_game(55)
        game.team_two = achtelfinale.winner_game(56)
        game.save!

        viertelfinale.games << game

        game = Game.new( :gametime => '2018-07-07T20:00:00' )
        game.stadium = Stadium.find_by_city('Sotschi')
        game.team_one = achtelfinale.winner_game(51)
        game.team_two = achtelfinale.winner_game(52)
        game.save!

        viertelfinale.games << game
      when "Halbfinale"
        game = Game.new( :gametime => '2018-07-10T21:00:00' )
        game.stadium = Stadium.find_by_city('Sank Petersburg')
        game.team_one = viertelfinale.winner_game(57)
        game.team_two = viertelfinale.winner_game(58)
        game.save!

        halbfinale.games << game

        game = Game.new( :gametime => '2018-07-10T21:00:00' )
        game.stadium = Stadium.find_by_city('Moskau (Luschniki)')
        game.team_one = viertelfinale.winner_game(59)
        game.team_two = viertelfinale.winner_game(60)
        game.save!

        halbfinale.games << game
      when "Finale 3. und 4. Platz"
        game = Game.new( :gametime => '2018-07-14T16:00:00' )
        game.stadium = Stadium.find_by_city('Sank Petersburg')
        game.team_one = halbfinale.loser_game(61)
        game.team_two = halbfinale.loser_game(62)
        game.save!

        finale34.games << game

        game = Game.new( :gametime => '2018-07-14T16:00:00' )
        game.stadium = Stadium.find_by_city('Moskau (Luschniki)')
        game.team_one = halbfinale.winner_game(61)
        game.team_two = halbfinale.winner_game(62)
        game.save!

        finale.games << game
    end
  end
end
end