module Contexts
  module Owners
    # FactoryBot uses the factory design pattern
    def create_owners #here is the method
      @alex = FactoryBot.create(:owner) # this creates the default owner Alex.
      @rachel = FactoryBot.create(:owner, first_name: "Rachel", active: false)
      @mark = FactoryBot.create(:owner, first_name: "Mark", phone: "412-268-8211")
    end
    # the following is inefficient, so using FactoryBot makes it more efficient and easier to do.
    # o=Owner.new
    # o.first_name="Rachel"

    def destroy_owners
      @rachel.destroy
      @mark.destroy
      @alex.destroy
    end

  end
end