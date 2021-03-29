class Reaction < ApplicationRecord
    belongs_to :reactionable, polymorphic: true

    enum reaction: { smile: 0, heart: 1, sad: 2 }
end
