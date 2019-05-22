require "rails_helper"

RSpec.describe Cart do
  song_hash = {"1" => 2, "2" => 3}
  subject { Cart.new(song_hash) }
  describe "total_count" do
    it "can calculate a total count" do
      expect(subject.total_count).to eq(5)
    end
  end

  describe "count_of" do
    it "counts individual songs" do
      expect(subject.count_of(5)).to eq(0)
      expect(subject.count_of(1)).to eq(2)
      expect(subject.count_of(2)).to eq(3)
    end
  end

  describe "add song" do
    it "adds a song to contents" do
      subject.add_song(1)
      subject.add_song(2)

      expected = {"1" => 3, "2" => 4}
      expect(subject.contents).to eq(expected)
    end
  end
end
