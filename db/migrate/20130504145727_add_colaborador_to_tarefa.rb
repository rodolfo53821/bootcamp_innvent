class AddColaboradorToTarefa < ActiveRecord::Migration
  def change
    add_column :tarefas, :colaborador_id, :integer
		remove_column :tarefas, :responsavel
  end
end
