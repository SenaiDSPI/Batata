json.extract! user, :id, :nome, :login, :email, :cargo, :nivel_acesso, :telefone, :tag
json.url user_url(user, format: :json)
