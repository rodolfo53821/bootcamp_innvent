class AddColaboradorToProjeto < ActiveRecord::Migration
  def change
    add_column :projetos, :colaborador_id, :integer
		remove_column :projetos, :responsavel
 end
end
