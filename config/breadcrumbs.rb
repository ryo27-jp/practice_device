crumb :root do
  link "Home", root_path
end

crumb :user_new do
  link "Projects", new_user_session_path
  parent :root
end

crumb :game_new do
  link "NewGame", new_game_path
  parent :root
end

crumb :ranking_new do
  link "NewRanking", new_ranking_path
  parent :root
end