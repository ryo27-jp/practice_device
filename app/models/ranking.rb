class Ranking < ApplicationRecord
  belongs_to :user
  belongs_to :first_place, class_name: "Game"
  belongs_to :second_place, class_name: "Game"
end
