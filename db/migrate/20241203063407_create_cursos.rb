class CreateCursos < ActiveRecord::Migration[8.0]
  def change
    create_table :cursos do |t|
      t.string :nome
      t.text :descricao
      t.date :dataTermino
      t.string :linkVideo

      t.timestamps
    end
  end
end
