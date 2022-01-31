class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :product, null: false, foreign_key: true, index: true
      t.integer :rating, null: false, inclusion: { :in => 0..5 }
      t.text :body

      t.timestamps
    end
  end
end
