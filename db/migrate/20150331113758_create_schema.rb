class CreateSchema < ActiveRecord::Migration
  def change

    create_table :users do |t|
      t.string :username
      t.string :password_digest

      t.timestamps
    end

    create_table :wishlists do |t|
      t.string :name
      t.references :user

      t.timestamps
    end

    create_table :products do |t|
      t.string :name
      t.references :category

      t.timestamps
    end

    create_join_table :products, :wishlists

    create_table :categories do |t|
      t.string :name

      t.timestamps
    end

  end
end
