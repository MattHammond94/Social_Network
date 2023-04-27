require 'user'

class UserRepository

  def create(user)
    sql = 'INSERT INTO users(email_address, username) VALUES($1, $2);'
    params = [user.email_address, user.username]
    DatabaseConnection.exec_params(sql, params)
  end

  def delete(id)
    sql = 'DELETE FROM users WHERE id = $1;'
    params = [id]
    DatabaseConnection.exec_params(sql, params)
  end

  def all
    results = DatabaseConnection.exec_params('SELECT * FROM users;', [])
    users = []
    results.each do |item|
      user = User.new
      user.id = item['id']
      user.email_address = item['email_address']
      user.username = item['username']
      users << user
    end
    users
  end

  def find(id)
    sql = 'SELECT id, email_address, username FROM users WHERE id = $1;'
    params = [id]
    selected = DatabaseConnection.exec_params(sql, params)
    found = selected[0]
    user = User.new 
    user.id = found['id']
    user.email_address = found['email_address']
    user.username = found['username']
    user
  end

  def update(user)
    sql = 'UPDATE users SET email_address = $1, username = $2 WHERE id = $3;'
    params = [user.email_address, user.username, user.id]
    update = DatabaseConnection.exec_params(sql, params)
  end
end