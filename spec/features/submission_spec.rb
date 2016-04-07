require "rails_helper"

RSpec.feature "submissions", type: :feature do

  describe "competitor submissions" do
    scenario "a competitor can make a submission" do
    end

    scenario "a competitor can attach files to a submission" do
    end

    scenario "an incomplete submission can be saved as draft" do
    end

    scenario "an submission can be saved as submit when complete" do
    end

    scenario "a competitor may not make more then 5 submissions in a day" do
    end

    scenario "a competitor must provide a submission message" do
    end

    scenario "exactly two files must be uploaded" do
    end
  end

  describe "submission evaluations" do
    scenario "a submission is created by a participant and is in ungraded status" do
    end

    scenario "when a submission is graded by an admin the leaderboard is updated" do
    end
  end

end
