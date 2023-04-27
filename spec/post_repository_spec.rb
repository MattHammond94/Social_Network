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
    expect(all.last.views).to eq '4'
  end

  it 'Should create a new post row from a post obj' do
    repo = PostRepository.new
    post_1 = double :post, title: 'A greeting', content: 'Hello', views: 0 , user_id: 1
    repo.create(post_1)
    expect(repo.all.last.title).to eq 'A greeting'
    expect(repo.all.last.content).to eq 'Hello'
    expect(repo.all.length).to eq 9
    expect(repo.all.last.user_id).to eq '1'
  end

  it 'Should remove the row from DB that corresponds with id passed to delete method as arg' do
    repo = PostRepository.new
    repo.delete(1)
    repo.delete(3)
    repo.delete(4)
    expect(repo.all.length).to eq 5
  end
end