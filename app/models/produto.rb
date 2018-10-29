class Produto < ApplicationRecord
	has_many :reposicao, dependent: :delete_all
	has_many :lista_produtos, dependent: :delete_all
end
