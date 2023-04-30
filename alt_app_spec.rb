require 'alt_app'

describe Application do
  it 'Should return a list of all users when choice == 1' do
    io = double :io
    expect(io).to receive(:puts).with("Welcome to the social media manager!")
    expect(io).to receive(:puts).with("What would you like to do?\n1 - List all users\n2 - List all posts")
    expect(io).to receive(:puts).with("Enter your choice:")
    expect(io).to receive(:gets).and_return("2")
  end
end