require 'post_repository'

describe PostRepository do
  def reset_post_table
    seed_sql = File.read('spec/post_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_post_table
  end

  it 'Should return all post table rows as an array ' do
    repo = PostRepository.new
    all = repo.all
    expect(all.length).to eq 8
    expect(all.first.content).to eq 'I ran out of mana so no more fire balls'
    expect(all.last.views).to eq 4
  end
end