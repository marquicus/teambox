require 'spec_helper'

describe "GitCommits" do
  describe "GET /git_commits" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get git_commits_path
      response.status.should be(200)
    end
  end
end
