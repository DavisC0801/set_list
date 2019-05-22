require "rails_helper"

RSpec.describe Cart do
  describe "total_count" do
    it "can calculate a total count" do
      song_hash = {"1" => 2, "2" => 3}
      cart = Cart.new(song_hash)

      expect(cart.total_count).to eq(5)
    end
  end
end
