json.extract! report, :id, :iso_code, :location, :date, :total_cases, :new_cases, :total_deaths, :new_deaths, :integer, :total_cases_per_million, :new_cases_per_million, :total_deaths_per_million, :new_deaths_per_million, :total_tests, :new_tests, :total_tests_per_thousand, :new_tests_per_thousand, :tests_units, :created_at, :updated_at
json.url report_url(report, format: :json)
