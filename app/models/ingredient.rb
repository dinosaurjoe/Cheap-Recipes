class Ingredient < ApplicationRecord
  belongs_to :recipe

    after_create :pluralize

    def pluralize
      @ingredient = self

      if @ingredient.measurement > 1
        @ingredient.measurement_type << "s"
        @ingredient.save!
      end
    end
end
