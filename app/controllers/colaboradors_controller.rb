class ColaboradorsController < ApplicationController

  def index
    @colaboradors = Colaborador.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @colaboradors }
    end
  end

  
  def show
    @colaborador = Colaborador.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @colaborador }
    end
  end

  def new
    @colaborador = Colaborador.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @colaborador }
    end
  end


  def edit
    @colaborador = Colaborador.find(params[:id])
  end


  def create
    @colaborador = Colaborador.new(params[:colaborador])

    respond_to do |format|
      if @colaborador.save
        format.html { redirect_to @colaborador, notice: 'Colaborador was successfully created.' }
        format.json { render json: @colaborador, status: :created, location: @colaborador }
      else
        format.html { render action: "new" }
        format.json { render json: @colaborador.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @colaborador = Colaborador.find(params[:id])

    respond_to do |format|
      if @colaborador.update_attributes(params[:colaborador])
        format.html { redirect_to @colaborador, notice: 'Colaborador was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @colaborador.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @colaborador = Colaborador.find(params[:id])
    @colaborador.destroy

    respond_to do |format|
      format.html { redirect_to colaboradors_url }
      format.json { head :no_content }
    end
  end
	
	def listAll
		@colaboradores = Colaborador.all
		respond_to do |format|
      	format.json { render json: @colaboradores }	
		end
	end
end
