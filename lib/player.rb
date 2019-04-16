require "pry"

class Player

  attr_accessor :name, :life_points

  def initialize(name, life_points = 10)
    @name = name
    @life_points = life_points
  end


  def show_state
    puts  "#{name} a #{life_points} points de vie"
  end

  def gets_damage (damage)
    @life_points -= damage
    if @life_points <= 0
      puts " "
      puts "💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀"
      puts " "
      puts "Le joueur #{@name} a été tué."
    end
    return @life_points
  end

  def attacks(player)
puts "🗡️  Le joueur #{@name} attaque le joueur #{player.name} 🗡️"
damage = compute_damage
puts "🤕  Il lui inflige #{damage} points de dommages  🤕 "
player.gets_damage(damage)
  end

def compute_damage
  return rand(1..6)
end



end
# binding.pry
