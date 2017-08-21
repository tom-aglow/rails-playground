class CreatePages < ActiveRecord::Migration[5.1]
  def up
    create_table :pages do |t|
      t.bigint 'subject_id'
      t.string 'name'
      t.integer 'permalink'
      t.integer 'position'
      t.boolean 'visible', :default => false, :null => false
      t.timestamps
    end

    add_index :pages, :subject_id
    add_index :pages, :permalink
  end

  def down
    drop_table :pages
  end
end
