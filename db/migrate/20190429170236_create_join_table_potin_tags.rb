class CreateJoinTablePotinTags < ActiveRecord::Migration[5.2]
  def change
    create_table :join_table_potin_tags do |t|
      t.belongs_to :potin, index: true
      t.belongs_to :tag, index: true

      t.timestamps
    end
  end
end
