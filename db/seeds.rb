# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(nome: 'Administrador', login: 'Admin', email: 'Admin@gmail.com', cargo: 'Developer', nivel_acesso: 'Admin', telefone: '(48)00000-0000', tag: '35e4548', admin: true, ativo: true, password: 'Admin2018', password_confirmation: 'Admin2018')