require 'rails_helper'

RSpec.describe "submissions/edit", type: :view do
  before(:each) do
    @submission = assign(:submission, Submission.create!(
      :challenge => nil,
      :participant => nil,
      :team => nil,
      :evaluated => false,
      :score => 1.5,
      :ranking => 1.5,
      :submission_type_cd => "MyString",
      :withdrawn => false
    ))
  end

  it "renders the edit submission form" do
    render

    assert_select "form[action=?][method=?]", submission_path(@submission), "post" do

      assert_select "input#submission_challenge_id[name=?]", "submission[challenge_id]"

      assert_select "input#submission_participant_id[name=?]", "submission[participant_id]"

      assert_select "input#submission_team_id[name=?]", "submission[team_id]"

      assert_select "input#submission_evaluated[name=?]", "submission[evaluated]"

      assert_select "input#submission_score[name=?]", "submission[score]"

      assert_select "input#submission_ranking[name=?]", "submission[ranking]"

      assert_select "input#submission_submission_type_cd[name=?]", "submission[submission_type_cd]"

      assert_select "input#submission_withdrawn[name=?]", "submission[withdrawn]"
    end
  end
end
