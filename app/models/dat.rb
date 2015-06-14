class Dat < ActiveRecord::Base
  has_many :results
  has_many :fines
  has_many :norms
end
