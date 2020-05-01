class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.string :iso_code
      t.string :location
      t.date :date
      t.integer :total_cases
      t.integer :new_cases
      t.integer :total_deaths
      t.string :new_deaths
      t.string :integer
      t.integer :total_cases_per_million
      t.integer :new_cases_per_million
      t.integer :total_deaths_per_million
      t.integer :new_deaths_per_million
      t.integer :total_tests
      t.integer :new_tests
      t.integer :total_tests_per_thousand
      t.integer :new_tests_per_thousand
      t.integer :tests_units

      t.timestamps
    end
    add_index :reports, :iso_code
    add_index :reports, :location
    add_index :reports, :date
  end
end
