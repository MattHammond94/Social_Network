require_relative './lib/post_repository'
require_relative './lib/user_repository'
require_relative './lib/database_connection'

class Application

  # The Application class initializer
  # takes four arguments:
  #  * The database name to call `DatabaseConnection.connect`
  #  * the Kernel object as `io` (so we can mock the IO in our tests)
  #  * the AlbumRepository object (or a double of it)
  #  * the ArtistRepository object (or a double of it)
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

    if choice == 1
      @io.puts "1"
    else
      @io.puts "2"
    end

    # so it can ask the user to enter some input
    # and then decide to run the appropriate action
    # or behaviour.

    # Use `@io.puts` or `@io.gets` to
    # write output and ask for user input.
  end
end

# Don't worry too much about this if statement. It is basically saying "only
# run the following code if this is the main file being run, instead of having
# been required or loaded by another file.
# If you want to learn more about __FILE__ and $0, see here: https://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Variables_and_Constants#Pre-defined_Variables
if __FILE__ == $0
  app = Application.new(
    'social_network',
    Kernel,
    PostRepository.new,
    UserRepository.new
  )
  app.run
end