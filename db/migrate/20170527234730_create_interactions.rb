class CreateInteractions < ActiveRecord::Migration[5.1]
  def change
    create_table :interactions do |t|
      t.integer :kind
      t.references :interactable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
