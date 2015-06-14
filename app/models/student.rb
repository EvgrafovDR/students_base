class Student < ActiveRecord::Base
  belongs_to :faculty
  belongs_to :group
  belongs_to :teacher
  has_many :results
end
