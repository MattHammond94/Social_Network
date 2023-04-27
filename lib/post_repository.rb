require 'post'

class PostRepository
  

  def create(post)
    sql = 'INSERT INTO posts(title, content, views, user_id) VALUES($1, $2, $3, $4);'
    params = [post.title, post.content, post.views, post.user_id]
    DatabaseConnection.exec_params(sql, params)
  end

  def delete(id)
    sql = 'DELETE FROM posts WHERE id = $1;'
    params = [id]
    DatabaseConnection.exec_params(sql, params)
  end

  # def find
    
  # end

  def all
    results = DatabaseConnection.exec_params('SELECT * FROM posts;', [])
    posts = []
    results.each do |row|
      post = Post.new
      post.title = row['title']
      post.content = row['content']
      post.views = row['views']
      post.user_id = row['user_id']
      posts << post
    end
    posts
  end
end