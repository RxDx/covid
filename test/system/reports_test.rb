require "application_system_test_case"

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:one)
  end

  test "visiting the index" do
    visit reports_url
    assert_selector "h1", text: "Reports"
  end

  test "creating a Report" do
    visit reports_url
    click_on "New Report"

    fill_in "Date", with: @report.date
    fill_in "Integer", with: @report.integer
    fill_in "Iso code", with: @report.iso_code
    fill_in "Location", with: @report.location
    fill_in "New cases", with: @report.new_cases
    fill_in "New cases per million", with: @report.new_cases_per_million
    fill_in "New deaths", with: @report.new_deaths
    fill_in "New deaths per million", with: @report.new_deaths_per_million
    fill_in "New tests", with: @report.new_tests
    fill_in "New tests per thousand", with: @report.new_tests_per_thousand
    fill_in "Tests units", with: @report.tests_units
    fill_in "Total cases", with: @report.total_cases
    fill_in "Total cases per million", with: @report.total_cases_per_million
    fill_in "Total deaths", with: @report.total_deaths
    fill_in "Total deaths per million", with: @report.total_deaths_per_million
    fill_in "Total tests", with: @report.total_tests
    fill_in "Total tests per thousand", with: @report.total_tests_per_thousand
    click_on "Create Report"

    assert_text "Report was successfully created"
    click_on "Back"
  end

  test "updating a Report" do
    visit reports_url
    click_on "Edit", match: :first

    fill_in "Date", with: @report.date
    fill_in "Integer", with: @report.integer
    fill_in "Iso code", with: @report.iso_code
    fill_in "Location", with: @report.location
    fill_in "New cases", with: @report.new_cases
    fill_in "New cases per million", with: @report.new_cases_per_million
    fill_in "New deaths", with: @report.new_deaths
    fill_in "New deaths per million", with: @report.new_deaths_per_million
    fill_in "New tests", with: @report.new_tests
    fill_in "New tests per thousand", with: @report.new_tests_per_thousand
    fill_in "Tests units", with: @report.tests_units
    fill_in "Total cases", with: @report.total_cases
    fill_in "Total cases per million", with: @report.total_cases_per_million
    fill_in "Total deaths", with: @report.total_deaths
    fill_in "Total deaths per million", with: @report.total_deaths_per_million
    fill_in "Total tests", with: @report.total_tests
    fill_in "Total tests per thousand", with: @report.total_tests_per_thousand
    click_on "Update Report"

    assert_text "Report was successfully updated"
    click_on "Back"
  end

  test "destroying a Report" do
    visit reports_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Report was successfully destroyed"
  end
end
