class ModifyTableNames < ActiveRecord::Migration
  def change
      drop_table :parental
      drop_table :marital
      drop_table :person
      create_table :marriages do |t|
        t.integer :spouse1_id
        t.integer :spouse2_id
        t.string :type
        t.boolean :current
        t.timestamps null: false
      end
      create_table :parents do |t|
          t.integer :child_id
          t.integer :parent_id
          t.boolean :adopted
          t.timestamps null: false
      end
      create_table :people do |t|
        t.string :name
        t.boolean :living
      end
  end
end
