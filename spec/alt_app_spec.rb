require_relative '../alt_app'
require 'user_repository'
require 'post_repository'

describe Application do
  it 'Should return a list of all users when choice is 1' do
    user_repo = UserRepository.new
    post_repo = double :post
    io = double :io
    expect(io).to receive(:puts).with("Welcome to the social media manager!").ordered
    expect(io).to receive(:puts).with("What would you like to do?\n1 - List all users\n2 - List all posts").ordered
    expect(io).to receive(:puts).with("Enter your choice:").ordered
    expect(io).to receive(:gets).and_return("1").ordered
    expect(io).to receive(:puts).with("1 - GreatBallsOfFire").ordered
    expect(io).to receive(:puts).with("2 - Mr.Worldwide").ordered
    expect(io).to receive(:puts).with("3 - BigKlopp").ordered
    expect(io).to receive(:puts).with("4 - TestUsername").ordered

    app = Application.new('social_network', io, post_repo, user_repo)
    app.run
  end

  it 'Should return a numbered list of post titles when choice is 2' do
    user_repo = double :user
    post_repo = PostRepository.new
    io = double :io
    expect(io).to receive(:puts).with("Welcome to the social media manager!").ordered
    expect(io).to receive(:puts).with("What would you like to do?\n1 - List all users\n2 - List all posts").ordered
    expect(io).to receive(:puts).with("Enter your choice:").ordered
    expect(io).to receive(:gets).and_return("2").ordered
    expect(io).to receive(:puts).with("1 - Had a really bad day").ordered
    expect(io).to receive(:puts).with("2 - Had another bad day").ordered
    expect(io).to receive(:puts).with("3 - We back").ordered
    expect(io).to receive(:puts).with("4 - At the barbers").ordered
    expect(io).to receive(:puts).with("5 - Checking in").ordered
    expect(io).to receive(:puts).with("6 - We got again").ordered
    expect(io).to receive(:puts).with("7 - Recording a new banger").ordered
    expect(io).to receive(:puts).with("8 - Test").ordered

    app = Application.new('social_network', io, post_repo, user_repo)
    app.run
  end

  it 'Should return a fail error when input is anything other than 1 or 2' do
    user_repo = double :user
    post_repo = double :post
    io = double :io
    expect(io).to receive(:puts).with("Welcome to the social media manager!").ordered
    expect(io).to receive(:puts).with("What would you like to do?\n1 - List all users\n2 - List all posts").ordered
    expect(io).to receive(:puts).with("Enter your choice:").ordered
    expect(io).to receive(:gets).and_return("3").ordered

    app = Application.new('social_network', io, post_repo, user_repo)
    expect { app.run }.to raise_error "This is not a valid input"
  end

  it 'Should return a fail error when input is anything other than 1 or 2' do
    user_repo = double :user
    post_repo = double :post
    io = double :io
    expect(io).to receive(:puts).with("Welcome to the social media manager!").ordered
    expect(io).to receive(:puts).with("What would you like to do?\n1 - List all users\n2 - List all posts").ordered
    expect(io).to receive(:puts).with("Enter your choice:").ordered
    expect(io).to receive(:gets).and_return("stringy").ordered

    app = Application.new('social_network', io, post_repo, user_repo)
    expect { app.run }.to raise_error "This is not a valid input"
  end
end