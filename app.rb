require_relative 'lib/database_connection'
require_relative 'lib/post_repository'
require_relative 'lib/user_repository'

DatabaseConnection.connect('social_network')

repo = PostRepository.new 
selected = repo.find(4)
puts selected.title