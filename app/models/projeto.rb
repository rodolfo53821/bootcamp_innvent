class Projeto < ActiveRecord::Base
  has_many :tarefas
	belongs_to :colaborador

  validates_presence_of :nome, :message => 'deve ser preenchido'
  validates_size_of :nome, :minimum => 3
  validates_presence_of :data_inicio
  validate :letra_maiuscula_projeto
  validate :data_atualizada



 	private
 	def data_atualizada
     errors.add(:data_entrega,"deve ser superior a data de inicio") unless  data_inicio <= 		Time.now
	end

  private 
    def letra_maiuscula_projeto
      errors.add(:nome, "Primeira letra do nome deve ser maiuscula") unless nome =~ /^[A-Z]/
    end
  
end
