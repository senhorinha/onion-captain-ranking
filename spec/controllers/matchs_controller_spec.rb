require "rails_helper"

describe MatchsController do
  context "#index" do
    let!(:match_one) { create(:match) }
    let!(:match_two) { create(:match) }
    let!(:match_three) { create(:match) }
    let!(:match_four) { create(:match) }

    it "should return in descending order of score" do
      get :index, format: :json
      matchs = JSON.parse(response.body)
      expect(response).to be_success
      expect(matchs[0]["score"]).to be >= matchs[1]["score"]
      expect(matchs[1]["score"]).to be >= matchs[2]["score"]
      expect(matchs[2]["score"]).to be >= matchs[3]["score"]
    end
  end

 context "#create" do
   context "with valid params" do
      let(:match) { {match: {player: "Captain", score: "666"}} }
      it "should create a new match" do
        post :create, match
        expect(response).to be_success
      end
   end

   context "with invalid params"
     let(:match) { {match: {player: "Captain"}} }
     it "should create a new match" do
       post :create, match
       expect(response).not_to be_success
     end
   end
end
