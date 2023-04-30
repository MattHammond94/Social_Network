require_relative './post'

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

  def find(id)
    sql = 'SELECT * FROM posts WHERE id = $1;'
    params = [id]
    selected = DatabaseConnection.exec_params(sql, params)
    found = selected[0]
    post = Post.new
    post.id = found['id']
    post.title = found['title']
    post.content = found['content']
    post.views = found['views']
    post.user_id = found['user_id']
    post
  end

  def all
    results = DatabaseConnection.exec_params('SELECT * FROM posts;', [])
    posts = []
    results.each do |row|
      post = Post.new
      post.id = row['id']
      post.title = row['title']
      post.content = row['content']
      post.views = row['views']
      post.user_id = row['user_id']
      posts << post
    end
    posts
  end

  def update(post)
    sql = 'UPDATE posts SET title = $1, content = $2, views = $3, user_id = $4 WHERE id = $5;'
    params = [post.title, post.content, post.views, post.user_id, post.id]
    update = DatabaseConnection.exec_params(sql, params)
  end
end