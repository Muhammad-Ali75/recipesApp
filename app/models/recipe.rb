class Recipe < ApplicationRecord
    validates :name, presence: true, length:{minimum: 2, maximum: 30}
    validates :description, presence: true, length:{minimum: 2}

belongs_to :chef
validates :chef_id, presence: true
end