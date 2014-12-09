class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :task, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
