class CreateAllTables < ActiveRecord::Migration
  def change
          create_table :parental do |t|
            t.integer :child_id
            t.integer :parent_id
            t.boolean :adopted
            t.timestamps null: false
          end

          create_table :marital do |t|
            t.integer :spouse1_id
            t.integer :spouse2_id
            t.string :type
            t.boolean :current
            t.timestamps null: false
          end

          create_table :person do |t|
            t.string :name
            t.boolean :living
          end
        end
      end
