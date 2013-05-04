# encoding: UTF-8
class TarefasController < ApplicationController

  def new
    @tarefa = Tarefa.new
    render 'novo'
  end

  def create
    @tarefa = Tarefa.new params[:tarefa]
		@tarefa.projeto = Projeto.find params[:projeto_id]
    if !@tarefa.save
      flash[:error] = "Existem erros que impedem a inclusão"
      render :novo
    else
      redirect_to :action => :index, notice: "Tarefa #{params[:id]} criada com sucesso"
    end
  end

  def index
    @projeto = Projeto.find params[:projeto_id]
    @tarefas = @projeto.tarefas

		respond_to do |format|
      format.html # index.html.erb
    end
  end

  def edit
    @tarefa = Tarefa.find params[:id]
  end

  def update
    @tarefa = Tarefa.find params[:id]
    @tarefa.update_attributes params[:tarefa]
    if @tarefa.save
      flash[:notice] = "Tarefa #{params[:id]} atualizada com sucesso"
      redirect_to :action => :index
    else
      flash[:error] = "Existem erros que impedem a atualizacao"
      render :action => :edit
    end
  end

  def destroy
    Tarefa.destroy params[:id]
    flash[:notice] = "Tarefa #{params[:id]} removida com sucesso"
    redirect_to :action => :index
  end

  def finalizar
    @tarefa = Tarefa.find params[:tarefa_id]
		@tarefa.update_attribute(:data_finalizacao, Time.now)

		 if @tarefa.save
      flash[:notice] = "Tarefa #{params[:tarefa_id]} finalizada com sucesso"
      redirect_to :action => :index
    else
      flash[:error] = "Existem erros que impedem a atualizacao"
      render :action => :index
    end

  end

	def listAll
		@tarefas = Tarefa.all
		respond_to do |format|
      	format.json { render json: @tarefas }	
		end
	end

end
