require 'test_helper'


  describe ChatController do
    it "can get the list of channels" do
      VCR.use_cassette("index_action") do
        get root_path
        must_respond_with :success
      end
    end
  end
