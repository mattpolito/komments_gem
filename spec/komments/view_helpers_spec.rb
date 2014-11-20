require 'spec_helper'
require 'komments/view_helpers'

class FakeView
  include Komments::ViewHelpers
end

describe FakeView do
  before do
    Komments.configuration.api_key = "API_KEY"
  end

  describe "#komments_script_tag" do
    context "by default" do
      it "returns an async script tag pointing to komments" do
        expected = %Q[<script async="async" src="//komments.net/embed/API_KEY"></script>]
        expect(described_class.new.komments_script_tag).to eq(expected)
      end
    end

    context "when passed false" do
      it "returns a deferred script tag pointing to komments" do
        expected = %Q[<script defer="defer" src="//komments.net/embed/API_KEY"></script>]
        expect(described_class.new.komments_script_tag(false)).to eq(expected)
      end
    end
  end
end
