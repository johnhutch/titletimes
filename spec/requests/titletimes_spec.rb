require 'spec_helper'

describe "Titletimes" do
  describe "GET /titletimes" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get titletimes_path
      response.status.should be(200)
    end
  end
end
