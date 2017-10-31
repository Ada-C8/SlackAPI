
require 'test_helper'

describe SlackApiWrapper do

  it "Can list a group of channels" do

    VCR.use_cassette("channels") do
      channels = SlackApiWrapper.list_channels

      channels.must_be_instance_of Array
      channels.length.must_be :>, 0
      channels.each do |channel|
        channel.must_be_instance_of Channel
      end
    end
  end

  it "Will return [] for a broken request" do
    VCR.use_cassette("channels") do
      channels = SlackApiWrapper.list_channels("BOGUS")

      channels.must_be_instance_of Array
      channels.must_equal []
    end

  end

  describe "send_msg" do
    it "can send a message to a channel" do
      VCR.use_cassette("send_msg") do
        response = SlackApiWrapper.send_msg "test-api-channel", "Chris - Test case"

        response.must_equal true
      end
    end


  end













end
