class CursosController < ApplicationController
  before_action :set_curso, only: %i[ show update destroy ]

  # GET /cursos
  def index
    @cursos = Curso.all

    render json: @cursos
  end

  # GET /cursos/1
  def show
    render json: @curso
  end

  # POST /cursos
  def create
    @curso = Curso.new(curso_params)

    if @curso.save
      render json: @curso, status: :created, location: @curso
    else
      render json: @curso.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cursos/1
  def update
    if @curso.update(curso_params)
      render json: @curso
    else
      render json: @curso.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cursos/1
  def destroy
    @curso.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_curso
      @curso = Curso.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def curso_params
      params.expect(curso: [ :nome, :descricao, :dataTermino, :linkVideo ])
    end
end
