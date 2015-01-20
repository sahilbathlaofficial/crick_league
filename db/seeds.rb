##Create IPL teams
ipl_teams = {}
[
  { city: 'HYD', name: 'Deccan Chargers' },
  { city: 'MUM', name: 'Mumbai Blasters' },
  { city: 'DEL', name: 'Delhi DareDevils' },
  { city: 'BAN', name: 'Royal Chalengers' }
].each do |team|
  ipl_teams[team[:city]] = IplTeam.find_or_create_by!(team)
end

puts 'Ipl Teams created !!!'

##Create Actual Players

[
  { name: 'Rohit Sharma', team_id: ipl_teams['MUM'], type: 'Batsman', cost: 12 },
  { name: 'Andrew Symonds', team_id: ipl_teams['MUM'], type: 'Batsman', cost: 12 },
  { name: 'Roger Dusty', team_id: ipl_teams['MUM'], type: 'Batsman', cost: 12 },
  { name: 'Siddu Sharma', team_id: ipl_teams['MUM'], type: 'WicketKeeper', cost: 12 },
  { name: 'Sachin Tendulkar', team_id: ipl_teams['MUM'], type: 'AllRounder', cost: 12 },
  { name: 'Mike Bravo', team_id: ipl_teams['MUM'], type: 'AllRounder', cost: 12 },
  { name: 'M.Malinga', team_id: ipl_teams['MUM'], type: 'Bowler', cost: 12 },
  { name: 'Del Styn', team_id: ipl_teams['MUM'], type: 'Bowler', cost: 12 },
  { name: 'Jaq Kalis', team_id: ipl_teams['HYD'], type: 'Batsman', cost: 12 },
  { name: 'Lance Klusner', team_id: ipl_teams['HYD'], type: 'Batsman', cost: 12 },
  { name: 'VVS Laxman', team_id: ipl_teams['HYD'], type: 'Batsman', cost: 12 },
  { name: 'Adam Gilli', team_id: ipl_teams['HYD'], type: 'WicketKeeper', cost: 12 },
  { name: 'Dell Bell', team_id: ipl_teams['HYD'], type: 'AllRounder', cost: 12 },
  { name: 'Gary Smith', team_id: ipl_teams['HYD'], type: 'AllRounder', cost: 12 },
  { name: 'A.Muller', team_id: ipl_teams['HYD'], type: 'Bowler', cost: 12 },
  { name: 'B.Muller', team_id: ipl_teams['HYD'], type: 'Bowler', cost: 12 },
  { name: 'V.Sehwag', team_id: ipl_teams['DEL'], type: 'Batsman', cost: 12 },
  { name: 'G.Gambhir', team_id: ipl_teams['DEL'], type: 'Batsman', cost: 12 },
  { name: 'S.Dhawan', team_id: ipl_teams['DEL'], type: 'Batsman', cost: 12 },
  { name: 'Kartik', team_id: ipl_teams['DEL'], type: 'WicketKeeper', cost: 12 },
  { name: 'A.Rodick', team_id: ipl_teams['DEL'], type: 'AllRounder', cost: 12 },
  { name: 'B.Rodick', team_id: ipl_teams['DEL'], type: 'AllRounder', cost: 12 },
  { name: 'Sshish Nehra', team_id: ipl_teams['DEL'], type: 'Bowler', cost: 12 },
  { name: 'A.Agarkar', team_id: ipl_teams['DEL'], type: 'Bowler', cost: 12 },
  { name: 'R.Dravid', team_id: ipl_teams['BAN'], type: 'Batsman', cost: 12 },
  { name: 'K.Peterson', team_id: ipl_teams['BAN'], type: 'Batsman', cost: 12 },
  { name: 'M.Philip', team_id: ipl_teams['BAN'], type: 'Batsman', cost: 12 },
  { name: 'S.Bower', team_id: ipl_teams['BAN'], type: 'WicketKeeper', cost: 12 },
  { name: 'A.Xavier', team_id: ipl_teams['BAN'], type: 'AllRounder', cost: 12 },
  { name: 'M.Magneto', team_id: ipl_teams['BAN'], type: 'AllRounder', cost: 12 },
  { name: 'A.Wanda', team_id: ipl_teams['BAN'], type: 'Bowler', cost: 12 },
  { name: 'S.Peatro', team_id: ipl_teams['BAN'], type: 'Bowler', cost: 12 }
].each do |player|
  Player.find_or_create_by!(player)
end

puts 'Players created !!!'


User.create(name: 'Sahil')

puts 'User and Ipl team created!!'