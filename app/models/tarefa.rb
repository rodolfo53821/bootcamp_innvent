class Tarefa < ActiveRecord::Base
  belongs_to :projeto
	belongs_to :colaborador
  
  validates_presence_of :descricao, {:message => "Deve ser preenchido"}
  validates_size_of :descricao, :minimum => 3
  validates_presence_of :projeto, {:message => "Deve ser preenchido"}

  scope :do_projeto, lambda{|projeto_id| Tarefa.where(:projeto_id => projeto_id)}
  
end
