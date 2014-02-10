class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :name

      t.timestamps
    end

    Message.create(:name => "This is message 1")
    Message.create(:name => "This is message 2")
  end
end
