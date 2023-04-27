require_relative 'lib/database_connection'
require_relative 'lib/post_repository'
require_relative 'lib/user_repository'

DatabaseConnection.connect('social_network')

posts_repo = PostRepository.new 
# selected = repo.find(4)
# puts selected.title
# puts selected.content

repo = UserRepository.new
# selected = repo.find(2)
# puts selected.username
# puts selected.id

user = User.new 
user.email_address = 'a_test_email.gmail.com'
user.username = 'ANewUsername420'
repo.create(user)

user_2 = User.new
user_2.email_address = 'anotherone@khaled.mail'
user_2.username = 'BigKhaled'
repo.create(user_2)

repo.delete(1)

all_users = repo.all
all_posts = posts_repo.all

all_users.each do |user|
  puts user.username
end

all_posts.each do |user|
  puts user.content
end

