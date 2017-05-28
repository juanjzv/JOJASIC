class Interaction < ApplicationRecord
  belongs_to :interactable, polymorphic: true
  enum kind: [:like, :listen]
end
