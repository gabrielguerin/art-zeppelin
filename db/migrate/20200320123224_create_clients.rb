# frozen_string_literal: true

class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.belongs_to :company, index: true
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :job
      t.string :gender
      t.string :address
      t.string :telephone
      t.text :comment
      t.timestamps
    end
  end
end
