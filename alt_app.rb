require_relative './lib/post_repository'
require_relative './lib/user_repository'
require_relative './lib/database_connection'

class Application

  def initialize(database_name, io, post_repository, user_repository)
    DatabaseConnection.connect(database_name)
    @io = io
    @post_repository = post_repository
    @user_repository = user_repository
  end

  def run
    @io.puts "Welcome to the social media manager!"
    @io.puts "What would you like to do?\n1 - List all users\n2 - List all posts"
    @io.puts "Enter your choice:"
    choice = @io.gets.chomp 

    if choice == "1"
      @user_repository.all.each { |user| @io.puts "#{user.id} - #{user.username}"}
    elsif choice == "2"
      @post_repository.all.each { |posts| @io.puts "#{posts.id} - #{posts.title}" }
    else
      fail "This is not a valid input"
    end
  end
end

if __FILE__ == $0
  app = Application.new(
    'social_network',
    Kernel,
    PostRepository.new,
    UserRepository.new
  )
  app.run
end