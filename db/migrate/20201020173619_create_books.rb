# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string  :title
      t.text    :description
      t.integer :user_id

      t.timestamps
    end
  end
end
