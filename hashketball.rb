require "pry"

 def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" =>{
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

def num_points_scored(name)

game_hash.each do |location, attributes|
  attributes.each do |data, value|
    if data == :players
      value.each do |names, v|
        if name == names
          v.each do |stat, values|
            if stat == :points
              return values
        # binding.pry
              end
            end
          end
        end
      end
    end
  end
end




def shoe_size(name)
  game_hash.each do |location, attributes|
    attributes[:players].each do |names, value|
          if name == names
            value.each do |stat, v|
              if stat == :shoe
                return v
              end
            end
          end
        end
      end
    end






def team_colors(team)

game_hash.each do |location, attributes|
  attributes.each do |data, values|
    if data == :team_name && values == team


            return attributes.fetch(:colors)
          end
        end
      end
    end





def team_names
  teams = []
  game_hash.each do |location, attributes|
    attributes.each do |k,v|
      if k == :team_name
        teams << v

      end
    end
  end
  teams
end

def player_numbers(team_name)
  numbers = []

  game_hash.each do |location, team|
    if team[:team_name] == team_name
      team[:players].each do |name, stats|
          stats.each do |stat, value|
            if stat == :number
              numbers << value
            end
          end
        end
      end
    end
numbers
end



def player_stats(player_name)
game_hash.each do |location, attributes|
  attributes[:players].each do |name, stats|
    if name == player_name
      return stats
      end
    end
  end
end

def big_shoe_rebounds
  largest_shoe = 0
  big_shoe_player = ""
  game_hash.each do |location, attributes|
    attributes.each do |data, values|
      if data == :players
    values.each do |name, stats|
  stats.each do |stat, value|
    if stat == :shoe && value > largest_shoe
      largest_shoe == value
      big_shoe_player = stats
    end
          end
        end
      end
    end
  end
big_shoe_player[:rebounds]
end

def most_points_scored
  most_points = 0
  most_points_player = ""
game_hash.each do |location, attributes|
  attributes.each do |data, values|
    if data == :players
values.each do |name, stats|
  stats.each do |stat, value|
    if stat == :points && value > most_points
      most_points = value
      most_points_player = name
            end
          end
        end
      end
    end
  end
most_points_player
end

def winning_team
  score = 0
  best_score = 0
  best_team = ""
game_hash.each do |location, team|
  team.each do |data, value|
    if data == :players
      value.each do |name, stats|
        stats.each do |stat, v|

          score += stat[:points]
           if score > best_score
              best_score = score
              best_team = team[:team_name]
end
        end
      end
    end
  end
  best_team
end


def player_with_longest_name
  name_length = 0
  player_with_name = ""
  game_hash.each do |location, team|
    team.each do |attribute, value|
      if attribute == :players
        value.each_key do |name|
          if name.length > name_length
            name_length = name.length
            player_with_name = name
          end
        end
      end
    end
  end
player_with_name
end

def long_name_steals_a_ton?
  longest_name = player_with_longest_name
  steals = 0
  steals_champ = ""
  game_hash.each do |location, team|
    team.each do |attribute, value|
      if attribute == :players
        value.each do |name, stats|
          if stats[:steals] > steals
            steals = stats[:steals]
            steals_champ = name
          end
        end
      end
    end
  end
  longest_name == steals_champ
end
