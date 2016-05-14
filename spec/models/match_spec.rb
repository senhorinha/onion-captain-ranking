require "rails_helper"

describe Match do
  context "#valides" do
    context "score" do
      it "should be greater than or equal 0" do
        post = Match.new(player: 'Captain', score: -1)
        expect(post.valid?).to be(false)
        expect(post.errors[:score]).to include("must be greater than or equal to 0")
      end
    end

    context "player" do
      it "should be required" do
        post = Match.new(score: 10)
        expect(post.valid?).to be(false)
        expect(post.errors[:player]).to include("can't be blank")
      end
    end
  end
end
