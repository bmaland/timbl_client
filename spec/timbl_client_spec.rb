require "rubygems"
require "rspec-expectations"
require "mocha"
include Mocha::API

require "timbl_client"

describe TimblClient do

  before(:all) do
    socket = stub(:gets => nil)
    TCPSocket.expects(:open).returns(socket)
    @client = TimblClient.new
  end

  it "should convert the server response to a hash" do
    response = "ERROR { The following feature(s) have only 1 value: 2 }\n" +
      "CATEGORY {1}\n"
    @client.format_response(response).should == {
      :error => "The following feature(s) have only 1 value: 2",
      :category => "1"
    }

    @client.format_response("CATEGORY {0}\n").should == {
      :category => "0"
    }
  end

end
