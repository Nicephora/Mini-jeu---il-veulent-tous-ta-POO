require 'bundler'
Bundler.require


require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josianne")        #on crée nos deux joueur de la classe Player que l'on met dans une variable
player2 = Player.new("José")

puts "Voici l'état de chaque joueur :
==============================="
print "> "
print"#{player1.show_state}"                            #on appel  la méthode show_state sur chaque joueur pour montrer leur vie etc
print "> "
print "#{player2.show_state}"
puts "Passons à la phase d'attaque"
puts " "
puts "                    ⚔️ ⚔️ ⚔️ ⚔️   😠 Letttttssss fiiiighhhht !!! 😠 ⚔️ ⚔️ ⚔️ ⚔️"
puts " "
while player1.life_points > 0 && player2.life_points > 0                  #tant que les deux joueur ont de la vie ils doivent se battre
  puts "============================================================================================"
  if player1.life_points <= 0                                         #ils se battent tout seul donc faut bien les stopper d'attaquer si ils n'ont plus de vie
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
