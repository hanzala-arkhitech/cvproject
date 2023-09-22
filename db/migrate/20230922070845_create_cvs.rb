class CreateCvs < ActiveRecord::Migration[7.0]
  def change
    create_table :cvs do |t|
      t.string :email
      t.string :cvemail
      t.string :image
      t.string :fullname
      t.string :phone
      t.string :sociallink
      t.string :schoolcollege
      t.string :major
      t.string :duration
      t.text :experience
      t.text :skills
      t.text :certification

      t.timestamps
    end
  end
end
