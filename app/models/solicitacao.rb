class Solicitacao < ApplicationRecord
  belongs_to :user
  has_many :lista_produtos, dependent: :destroy
end
