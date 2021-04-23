class BlogPost < ApplicationRecord
  include ValidatableEnum

  enum state: %i[draft published]
  validates :state, inclusion: { in: states.keys, 
                                  message: "state must be one of #{states.keys}" }
  validatable_enum :state
end
