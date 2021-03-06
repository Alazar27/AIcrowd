require 'rails_helper'

describe "participant accesses challenge", :js do
  let!(:challenge) { create(:challenge, :running) }
  let!(:draft_challenge) { create(:challenge, :draft) }
  let!(:participant) { create(:participant) }
  let!(:running_participant) { create(:challenge_participant, challenge: challenge, participant: participant) }
  let!(:draft_participant) { create(:challenge_participant, challenge: draft_challenge, participant: participant) }


  describe "participant can view challenges list" do
    before do
      log_in participant
      visit '/challenges'
    end

    specify { expect(page).to have_link challenge.challenge }
    # specify { expect(page).to have_link 'Knowledge Base' }
    specify { expect(page).to have_link 'Challenges' }
  end

  describe "participant can view challenge details" do
    before do
      log_in participant
      visit '/challenges'
      click_link challenge.challenge
    end

    specify { expect(page).to have_content challenge.challenge }
    specify { expect(page).to have_content challenge.tagline }
  end

  describe "participant" do
    before do
      log_in participant
      visit '/challenges'
      click_link challenge.challenge
    end

    it "can follow Overview link" do
      click_link "Overview"
      expect(page).to have_content 'Overview'
    end

  end

  describe "access restricted parts of the challenge" do
    before do
      log_in participant
      visit '/challenges'
      click_link challenge.challenge
    end

  end
end
