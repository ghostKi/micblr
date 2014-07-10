class User < ActiveRecord::Base

  # Verificação da informação inserida pelo user na db

  # Constante que verifica se o endereço de email esta no formato : user@mail.com
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # Nome tem de existir e no máximo pode ocupar 14 caracteres
  validates :name, presence: true, length: { maximum: 14 }

  # Email tem de existir, respeitar o formato acima mencionado e tem de ser unico (e não pode ser case sensitive)
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  # Password tem de existir e no máximo pode ocupar 14 caracteres
  validates :password, presence: true, length: { maximum: 14 }

  # Antes de guardar o email na instância tem de ser convertido para downcase
  before_create :downcase_email

  def downcase_email
    self.email = email.downcase
  end

end
