require 'bundler'
Bundler.require

require_relative 'lib/game'                          #On lie app_2 aux autres fichiers rb (classes) se trouvant dans le lib
require_relative 'lib/player'

def perform
  puts "⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️
  Bienvenue sur 'ILS VEULENT TOUS MA POO💩'!      ⚔️
  Le but du jeu est d'être le dernier survivant !⚔️
  ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ ⚔️ "
  puts " "
  puts "🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮"
  puts "PEGI 18"
  puts "Ce jeux est déconseillé au moins de 18 ans."
  puts "Il comporte des scènes qui peuvent choquer les personnes sensibles"
  puts "Tu vois Fortnite? "                                                                      #Cest juste des puts on s'en fou
  puts "Eh ben cest de la 💩 comparé à ce jeu 👺 "
  puts "Vous êtes prêts?"
  puts "Vraiment ?"
  puts "Bon on y va alors"
  puts "Maintenant"
  puts "Ok je démarre le jeux là"
  puts "🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮 🎮"

  puts "Choisis un nom de joueur"
  player_name = gets.chomp                         #on récupère le nom insérer par l'utilisateur
  user = HumanPlayer.new(player_name)              #on crée un nouveau joueur dans la class HumanPlayer qui aura le nom rentré précédement

  player1 = Player.new("José")                     #On crée 2 players avec des noms différents
  player2 = Player.new("Josianne")

  ennemies = []                              #On crée un array pour stocker les ennemies
  ennemies << player1                        #On les met dans l'array
  ennemies << player2

  while user.life_points > 0 && (player1.life_points > 0 || player2.life_points >0)       # Cette boucle va checker si soit le user est envie soit les ennemis et ensuite s'executer.

    if player1.life_points > 0 && player2.life_points >0                                  #cette boucle if me permet d'enlever des éléments du menus (quand un des ennemies est mort)
      puts "===========================================================================
      Quelle action veux-tu effectuer ?

      a - chercher une meilleure arme
      s - chercher à se soigner

      attaquer un joueur en vue :
      0 - Josiane a #{player2.life_points} points de vie
      1 - José a #{player1.life_points} points de vie
      ==========================================================================="

    elsif player1.life_points <= 0
      puts "===========================================================================
      Quelle action veux-tu effectuer ?

      a - chercher une meilleure arme
      s - chercher à se soigner

      attaquer un joueur en vue :
      0 - Josiane a #{player2.life_points} points de vie
      ==========================================================================="

    elsif player2.life_points <= 0
      puts "===========================================================================
      Quelle action veux-tu effectuer ?

      a - chercher une meilleure arme
      s - chercher à se soigner

      attaquer un joueur en vue :
      1 - José a #{player1.life_points} points de vie
      ==========================================================================="
    end
    choice = gets.chomp
    case choice                                             #j'utilise le case pour gérer chaque cas que l'utilisateur peut rentrer
    when "a"
      user.search_weapon
    when "s"
      user.search_health_pack               #je fais appel au différentes méthodes du player sur le user
    when "0"
      user.attacks(player2)
    when "1"
      user.attacks(player1)
    else
      puts "Euhhhh! Je ne comprends pas. Choisi 'a', 's', '0' ou '1'"
    end
    ennemies.each do |ennemi|          #sélectionner chaque ennemi de l'array
      if ennemi.life_points > 0                       # si les ennemis ont encore de la vie ils peuvent attaquer
        puts " "
        puts "Les autres joueurs t'attaquent !"
        ennemi.attacks(user)                         #on appelle la méthode attacks du user qu'on applique sur l'array ennemi
        puts " "
        puts "#{user.show_state}"
        puts "********************************************************************"

      end
    end
  end

  puts" "
  puts"==========================================================================="




  puts "Le jeu est terminé."

  if user.life_points > 0                                      #si il a plus de 0 de vie c'est quil a gagner
    puts "Bravo tu as gagné 👌👌👌👌👌👌👌👌👌👌👌"
  else
    puts "T'es quand même un sacré Looser 👎 👎 👎 👎 👎 👎 👎 👎 "
  end
end

perform
