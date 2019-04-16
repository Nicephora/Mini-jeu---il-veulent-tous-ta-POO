require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️
Bienvenue sur 'ILS VEULENT TOUS MA POO💩'!      ⚔️
Le but du jeu est d'être le dernier survivant !⚔️
⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ "
puts " "
puts "🎮🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮"
puts "PEGI 18"
puts "Ce jeux est déconseillé au moins de 18 ans."
puts "Il comporte des scènes qui peuvent choquer les personnes sensibles"
puts "Tu vois Fortnite? "
puts "Eh ben cest de la 💩 comparé à ce jeu 👺 "
puts "Vous êtes prêts?"
puts "Vraiment ?"
puts "Bon on y va alors"
puts "Maintenant"
puts "Ok je démarre le jeux là"
puts "🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮"

puts "Choisis un nom de joueur"
player_name = gets.chomp
user = HumanPlayer.new(player_name)

player1 = Player.new("José")
player2 = Player.new("Josianne")

ennemies = []
ennemies << player1
ennemies << player2

while user.life_points > 0 && (player1.life_points > 0 || player2.life_points >0)
  puts "===========================================================================
  Quelle action veux-tu effectuer ?

  a - chercher une meilleure arme
  s - chercher à se soigner

  attaquer un joueur en vue :
  0 - Josiane a #{player2.life_points} points de vie
  1 - José a #{player1.life_points} points de vie
  ================================================================================="
  choice = gets.chomp
  case choice
  when "a"
    user.search_weapon
  when "s"
    user.search_health_pack
  when "0"
    user.attacks(player2)
  when "1"
    user.attacks(player1)
  else
    puts "Euhhhh! Je ne comprends pas. Choisi 'a', 's', '0' ou '1'"
  end
  ennemies.each do |ennemi|
    if ennemi.life_points > 0
      puts " "
      puts "Les autres joueurs t'attaquent !"
      ennemi.attacks(user)
      puts " "
      puts "#{user.show_state}"
      puts "********************************************************************"

    end
  end
end

puts" "
puts"============================================================================="




puts "Le jeu est terminé."

if user.life_points > 0
  puts "Bravo tu as gagné 👌👌👌👌👌👌👌👌👌👌👌"
else
  puts "T'es quand même un sacré Looser 👎 👎 👎 👎 👎 👎 👎 👎 "
end
