class Idea < ApplicationRecord

  validates :body, presence: true   
  # sorting helper method
end
