require 'bundler'
Bundler.require


require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josianne")
player2 = Player.new("José")

puts "Voici l'état de chaque joueur :
==============================="
print "> "
print"#{player1.show_state}"
print "> "
print "#{player2.show_state}"
puts "Passons à la phase d'attaque"
puts " "
puts "                    ⚔️ ⚔️ ⚔️ ⚔️   😠 Letttttssss fiiiighhhht !!! 😠 ⚔️ ⚔️ ⚔️ ⚔️"
puts " "
while player1.life_points > 0 && player2.life_points > 0
  puts "============================================================================================"
  if player1.life_points <= 0
    break
  else player1.attacks(player2)
  end
  puts "============================================================================================"
  if player2.life_points <= 0
    break
  else player2.attacks(player1)
  end
end




# binding.pry
