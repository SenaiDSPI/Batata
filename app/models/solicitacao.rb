class Solicitacao < ApplicationRecord
  belongs_to :user
  has_many :listas_produtos, dependent: :delete_all
end
