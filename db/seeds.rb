#Admin erstellen

u = User.create(:email => "admin@kek-it.de", :nickname => "leon", :password => "topsecret", :password_confirmation => "topsecret", :role_name => 'admin', points: 10)
u1 = User.create(:email => "karlheinz@kek-it.de", :nickname => "karlheinz", :password => "topsecret", :password_confirmation => "topsecret", :role_name => 'admin', points: 8)
u2 = User.create(:email => "julian@kek-it.de", :nickname => "julian", :password => "topsecret", :password_confirmation => "topsecret", :role_name => 'admin', points: 3)
u3 = User.create(:email => "bernhard@kek-it.de", :nickname => "bernhard", :password => "topsecret", :password_confirmation => "topsecret", :role_name => 'admin', points: 5)
#Gruppen erstellen
gruppe_a = Group.create!(:name => 'A')

gruppe_a.teams << A1 = Team.create!( :position => 'A1', :country => 'Russland', :flag_url => '1f1f7-1f1fa', :shortname => 'RUS')
gruppe_a.teams << A2 = Team.create!( :position => 'A2', :country => 'Saudi Arabien', :flag_url => '1f1f8-1f1e6', :shortname => 'KSA')
gruppe_a.teams << A3 = Team.create!( :position => 'A3', :country => 'Ägypten', :flag_url => '1f1ea-1f1ec', :shortname => 'EGY')
gruppe_a.teams << A4 = Team.create!( :position => 'A4', :country => 'Uruguay', :flag_url => '1f1fa-1f1fe', :shortname => 'URU')

gruppe_b = Group.create!(:name => 'B')

gruppe_b.teams << B1 = Team.create!( :position => 'B1', :country => 'Portugal', :flag_url => '1f1f5-1f1f9', :shortname => 'POR')
gruppe_b.teams << B2 = Team.create!( :position => 'B2', :country => 'Spanien', :flag_url => '1f1ea-1f1e6', :shortname => 'ESP')
gruppe_b.teams << B3 = Team.create!( :position => 'B3', :country => 'Marokko', :flag_url => '1f1f2-1f1e6', :shortname => 'MAR')
gruppe_b.teams << B4 = Team.create!( :position => 'B4', :country => 'Iran', :flag_url => '1f1ee-1f1f7', :shortname => 'IRN')

gruppe_c = Group.create!(:name => 'C')

gruppe_c.teams << C1 = Team.create!( :position => 'C1', :country => 'Frankreich', :flag_url => '1f1eb-1f1f7', :shortname => 'FRA')
gruppe_c.teams << C2 = Team.create!( :position => 'C2', :country => 'Australien', :flag_url => '1f1e6-1f1fa', :shortname => 'AUS')
gruppe_c.teams << C3 = Team.create!( :position => 'C3', :country => 'Peru', :flag_url => '1f1f5-1f1ea', :shortname => 'PER')
gruppe_c.teams << C4 = Team.create!( :position => 'C4', :country => 'Dänemark', :flag_url => '1f1e9-1f1f0', :shortname => 'DEN')

gruppe_d = Group.create!(:name => 'D')

gruppe_d.teams << D1 = Team.create!( :position => 'D1', :country => 'Argentinien', :flag_url => '1f1e6-1f1f7', :shortname => 'ARG')
gruppe_d.teams << D2 = Team.create!( :position => 'D2', :country => 'Island', :flag_url => '1f1ee-1f1f8', :shortname => 'ISL')
gruppe_d.teams << D3 = Team.create!( :position => 'D3', :country => 'Kroatien', :flag_url => '1f1ed-1f1f7', :shortname => 'CRO')
gruppe_d.teams << D4 = Team.create!( :position => 'D4', :country => 'Nigeria', :flag_url => '1f1f3-1f1ec', :shortname => 'NGA')

gruppe_e = Group.create!(:name => 'E')

gruppe_e.teams << E1 = Team.create!( :position => 'E1', :country => 'Brasilien', :flag_url => '1f1e7-1f1f7', :shortname => 'BRA')
gruppe_e.teams << E2 = Team.create!( :position => 'E2', :country => 'Schweiz', :flag_url => '1f1e8-1f1ed', :shortname => 'SUI')
gruppe_e.teams << E3 = Team.create!( :position => 'E3', :country => 'Costa Rica', :flag_url => '1f1e8-1f1f7', :shortname => 'CRC')
gruppe_e.teams << E4 = Team.create!( :position => 'E4', :country => 'Serbien', :flag_url => '1f1f7-1f1f8', :shortname => 'SRB')

gruppe_f = Group.create!(:name => 'F')

gruppe_f.teams << F1 = Team.create!( :position => 'F1', :country => 'Deutschland', :flag_url => '1f1e9-1f1ea', :shortname => 'GER')
gruppe_f.teams << F2 = Team.create!( :position => 'F2', :country => 'Mexiko', :flag_url => '1f1f2-1f1fd', :shortname => 'MEX')
gruppe_f.teams << F3 = Team.create!( :position => 'F3', :country => 'Schweden', :flag_url => '1f1f8-1f1ea', :shortname => 'SWE')
gruppe_f.teams << F4 = Team.create!( :position => 'F4', :country => 'Südkorea', :flag_url => '1f1f0-1f1f7', :shortname => 'KOR')

gruppe_g = Group.create!(:name => 'G')

gruppe_g.teams << G1 = Team.create!( :position => 'G1', :country => 'Belgien', :flag_url => '1f1e7-1f1ea', :shortname => 'BEL')
gruppe_g.teams << G2 = Team.create!( :position => 'G2', :country => 'Panama', :flag_url => '1f1f5-1f1e6', :shortname => 'PAN')
gruppe_g.teams << G3 = Team.create!( :position => 'G3', :country => 'Tunesien', :flag_url => '1f1f9-1f1f3', :shortname => 'TUN')
gruppe_g.teams << G4 = Team.create!( :position => 'G4', :country => 'England', :flag_url => '1f3f4-e0067', :shortname => 'ENG')

gruppe_h = Group.create!(:name => 'H')

gruppe_h.teams << H1 = Team.create!( :position => 'H1', :country => 'Polen', :flag_url => '1f1f5-1f1f1', :shortname => 'POL')
gruppe_h.teams << H2 = Team.create!( :position => 'H2', :country => 'Senegal', :flag_url => '1f1f8-1f1f3', :shortname => 'SEN')
gruppe_h.teams << H3 = Team.create!( :position => 'H3', :country => 'Kolumbien', :flag_url => '1f1e8-1f1f4', :shortname => 'COL')
gruppe_h.teams << H4 = Team.create!( :position => 'H4', :country => 'Japan', :flag_url => '1f1ef-1f1f5', :shortname => 'JPN')

#Stadien

stadia = Stadium.create!([
        {:name => 'Jekaterinburg-Arena', :city => 'Jekaterinburg'},
        {:name => 'Kaliningrad-Stadion', :city => 'Kaliningrad'},
        {:name => 'Kasan-Arena', :city => 'Kasan'},
        {:name => 'Luschniki-Stadion', :city => 'Moskau (Luschniki)'},
        {:name => 'Spartak-Stadion', :city => 'Moskau (Spartak)'},
        {:name => 'Nischni-Nowgorod-Stadion', :city => 'Nischni Nowgorod'},
        {:name => 'Rostow-Arena', :city => 'Rostow am Don'},
        {:name => 'Sankt-Petersburg-Stadion', :city => 'Sankt Petersburg'},
        {:name => 'Samara Arena', :city => 'Samara'},
        {:name => 'Mordwinien-Arena', :city => 'Saransk'},
        {:name => 'Fischt-Stadion', :city => 'Sotschi'},
        {:name => 'Wolgograd-Arena', :city => 'Wolgograd'},
        ])

#Spiele Runde 1
#Gruppe A

game = Game.new( :gametime => '2018-06-14T17:00:00' )
game.stadium = Stadium.find_by_city('Moskau (Luschniki)')
game.team_one = A1
game.team_two = A2
game.group = gruppe_a
game.save!

game = Game.new( :gametime => '2018-06-15T14:00:00' )
game.stadium = Stadium.find_by_city('Jekaterinburg')
game.team_one = A3
game.team_two = A4
game.group = gruppe_a
game.save!

#Gruppe B

game = Game.new( :gametime => '2018-06-15T20:00:00' )
game.stadium = Stadium.find_by_city('Sotschi')
game.team_one = B1
game.team_two = B2
game.group = gruppe_b
game.save!

game = Game.new( :gametime => '2018-06-15T17:00:00' )
game.stadium = Stadium.find_by_city('Sankt Petersburg')
game.team_one = B3
game.team_two = B4
game.group = gruppe_b
game.save!

#Gruppe C

game = Game.new( :gametime => '2018-06-16T12:00:00' )
game.stadium = Stadium.find_by_city('Kasan')
game.team_one = C1
game.team_two = C2
game.group = gruppe_c
game.save!

game = Game.new( :gametime => '2018-06-16T18:00:00' )
game.stadium = Stadium.find_by_city('Saransk')
game.team_one = C3
game.team_two = C4
game.group = gruppe_c
game.save!

#Gruppe D

game = Game.new( :gametime => '2018-06-16T15:00:00' )
game.stadium = Stadium.find_by_city('Moskau (Spartak)')
game.team_one = D1
game.team_two = D2
game.group = gruppe_d
game.save!

game = Game.new( :gametime => '2018-06-16T21:00:00' )
game.stadium = Stadium.find_by_city('Kaliningrad')
game.team_one = D3
game.team_two = D4
game.group = gruppe_d
game.save!

#Gruppe E

game = Game.new( :gametime => '2018-06-16T20:00:00' )
game.stadium = Stadium.find_by_city('Rostow am Don')
game.team_one = E1
game.team_two = E2
game.group = gruppe_e
game.save!

game = Game.new( :gametime => '2018-06-17T14:00:00' )
game.stadium = Stadium.find_by_city('Samara')
game.team_one = E3
game.team_two = E4
game.group = gruppe_e
game.save!

#Gruppe F

game = Game.new( :gametime => '2018-06-17T17:00:00' )
game.stadium = Stadium.find_by_city('Moskau (Luschniki)')
game.team_one = F1
game.team_two = F2
game.group = gruppe_f
game.save!

game = Game.new( :gametime => '2018-06-18T14:00:00' )
game.stadium = Stadium.find_by_city('Nischni Nowgorod')
game.team_one = F3
game.team_two = F4
game.group = gruppe_f
game.save!

#Gruppe G

game = Game.new( :gametime => '2018-06-18T17:00:00' )
game.stadium = Stadium.find_by_city('Sotschi')
game.team_one = G1
game.team_two = G2
game.group = gruppe_g
game.save!

game = Game.new( :gametime => '2018-06-18T20:00:00' )
game.stadium = Stadium.find_by_city('Wolgograd')
game.team_one = G3
game.team_two = G4
game.group = gruppe_g
game.save!

#Gruppe H

game = Game.new( :gametime => '2018-06-19T17:00:00' )
game.stadium = Stadium.find_by_city('Moskau (Spartak)')
game.team_one = H1
game.team_two = H2
game.group = gruppe_h
game.save!

game = Game.new( :gametime => '2018-06-19T14:00:00' )
game.stadium = Stadium.find_by_city('Saransk')
game.team_one = H3
game.team_two = H4
game.group = gruppe_h
game.save!