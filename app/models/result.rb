class Result < ActiveRecord::Base
  belongs_to :dat
  belongs_to :student
  belongs_to :norm
end
