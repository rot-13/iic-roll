class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :full_name, null: false
      t.string :email, null: false
      t.string :something_funny, null: false
    end
  end
end
