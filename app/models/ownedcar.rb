class Ownedcar < ApplicationRecord
	belongs_to :user

	def setup(params = {})
	  self.year = params.fetch(:year, 1)
	  self.make = params.fetch(:make, "automobile")
	  self.model = params.fetch(:model, "car")
	  self.coolness_value = params.fetch(:coolness_value, 1)
	  self.horsepower = params.fetch(:horsepower, 1)
	  self.torque = params.fetch(:torque, 1)
	  self.weight = params.fetch(:weight, 1)
	  self.user = params.fetch(:user, User.new)
	end

	def calculate_power_to_weight_ratio
      self.horsepower.fdiv(self.weight)
    end

    def info
      self.year.to_s + " " + self.make + " " + self.model + ", hp " + self.horsepower.to_s + ", tq " + self.torque.to_s + ", weight " + self.weight.to_s
    end

    def does_opponent_win_simple_drag_race?(opponent_car)
      if opponent_car.calculate_power_to_weight_ratio > self.calculate_power_to_weight_ratio
        true
      else
        false
      end
    end
end
