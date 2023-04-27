require 'user_repository'

describe UserRepository do

  def reset_users_table
    seed_sql = File.read('spec/user_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_users_table
  end

  it 'Should return an array of all rows within users' do
    repo = UserRepository.new
    users = repo.all 
    expect(users.length).to eq 4
    expect(users.first.id).to eq '1'
    expect(users.first.email_address).to eq 'obsidian_fire_mage69@gmail.com'
    expect(users[2].username).to eq 'BigKlopp'
  end

  it 'Should return the selected row' do
    repo = UserRepository.new 
    user = repo.find(2)
    expect(user.username).to eq 'Mr.Worldwide'
  end

  it 'Should return the selected row' do
    repo = UserRepository.new 
    user = repo.find(3)
    expect(user.email_address).to eq 'gengenpressed_to_perfection@tisacli.net'
    expect(user.id).to eq '3'
  end

  it 'Should take a user object as an arg and add it to the DB as a row' do
    repo = UserRepository.new
    user_1 = User.new
    user_1.email_address = 'mattymoomilk@tiscali.net'
    user_1.username = 'MattyMooMilk'
    repo.create(user_1)
    expect(repo.all.last.email_address).to eq 'mattymoomilk@tiscali.net'
    expect(repo.all.last.username).to eq 'MattyMooMilk'
    expect(repo.all.length).to eq 5
    expect(repo.all.last.id).to eq '5'
  end
end