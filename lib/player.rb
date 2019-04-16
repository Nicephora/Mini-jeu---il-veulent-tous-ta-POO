require "pry"

class Player

  attr_accessor :name, :life_points

  def initialize(name, life_points = 10)  #on a initialisé la life_points à 10
    @name = name
    @life_points = life_points
  end


  def show_state
    puts  "#{name} a #{life_points} points de vie"        #lon affiche e nom du joueur avec ses points de vie
  end

  def gets_damage (damage)
    @life_points -= damage             #on remplace le life_points par le life_points - les damages qui passent en entrée de la déf( qui proviennent du compute dammage)
    if @life_points <= 0               #si ça vie est inférieur ou égal à 0 on dit quil est dead
      puts " "
      puts "💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀"
      puts " "
      puts "Le joueur #{@name} a été tué."
    end
    return @life_points
  end

  def attacks(player)
    puts "🗡️  Le joueur #{@name} attaque le joueur #{player.name} 🗡️"    #montrer qui attaque qui et quels dégats sont infligés
    damage = compute_damage
    puts "🤕  Il lui inflige #{damage} points de dommages  🤕."
    player.gets_damage(damage)
  end

  def compute_damage                     # le créateur de damage random (comme des dés)
    return rand(1..6)
  end

end

class HumanPlayer < Player                     #la classe HumanPlayer hérite de la classe Player

  attr_accessor :weapon_level        #on rajoute la weapon_level

  def initialize(name, life_points = 100, weapon_level = 1)           #de base on lui met 1
    @name = name
    @life_points = life_points                                       #je pouvais ne pas recopier ça et mettre super
    @weapon_level = weapon_level
  end

  def show_state
    "#{name} a #{life_points} points de vie et une arme de niveau #{weapon_level}"
  end

  def compute_damage                           #on met à jour le compute damage, cette fois il va etre multiplié par la puissance de l'arme(son niveau)
    rand(1..6) * @weapon_level
  end

  def search_weapon
    new_weapon = rand(1..6)                       #on tire au sort le niveau de l'arme
    puts "Tu as trouvé une arme de niveau #{new_weapon}."
    if new_weapon > @weapon_level
      @weapon_level = new_weapon                  #si le niveau est supérieur à l'arme qu'il avait avant il l'a prend sinon il garde l'ancienne
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack
    health_pack = rand(1..6)                      #on tire au sort la valeur du health_pack
    if health_pack == 1
      puts "Tu n'as rien trouvé... "

    elsif health_pack <= 5 && health_pack >= 2
      @life_points += 50
      if @life_points > 100
        @life_points = 100                                    #on fait monté la vie jusqu'à 100 mais pas plus
      end
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
    else
      @life_points += 80
      if @life_points > 100
        @life_points = 100
      end
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
    end
  end
end
