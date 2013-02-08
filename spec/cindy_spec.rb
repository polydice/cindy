require 'spec_helper'

describe Cindy do

  describe ".new" do

    it "is a Cindy::Client" do
      expect(Cindy.new("http://foo.com/")).to be_a Cindy::Client
    end

  end

end
