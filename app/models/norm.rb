class Norm < ActiveRecord::Base
  has_many :results
  has_many :fines
  belongs_to :dat
end
