require "spec_helper"

RSpec.describe Sinatra::To::Do do
  it "has a version number" do
    expect(Sinatra::To::Do::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
