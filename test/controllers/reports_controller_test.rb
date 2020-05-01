require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @report = reports(:one)
  end

  test "should get index" do
    get reports_url
    assert_response :success
  end

  test "should get new" do
    get new_report_url
    assert_response :success
  end

  test "should create report" do
    assert_difference('Report.count') do
      post reports_url, params: { report: { date: @report.date, integer: @report.integer, iso_code: @report.iso_code, location: @report.location, new_cases: @report.new_cases, new_cases_per_million: @report.new_cases_per_million, new_deaths: @report.new_deaths, new_deaths_per_million: @report.new_deaths_per_million, new_tests: @report.new_tests, new_tests_per_thousand: @report.new_tests_per_thousand, tests_units: @report.tests_units, total_cases: @report.total_cases, total_cases_per_million: @report.total_cases_per_million, total_deaths: @report.total_deaths, total_deaths_per_million: @report.total_deaths_per_million, total_tests: @report.total_tests, total_tests_per_thousand: @report.total_tests_per_thousand } }
    end

    assert_redirected_to report_url(Report.last)
  end

  test "should show report" do
    get report_url(@report)
    assert_response :success
  end

  test "should get edit" do
    get edit_report_url(@report)
    assert_response :success
  end

  test "should update report" do
    patch report_url(@report), params: { report: { date: @report.date, integer: @report.integer, iso_code: @report.iso_code, location: @report.location, new_cases: @report.new_cases, new_cases_per_million: @report.new_cases_per_million, new_deaths: @report.new_deaths, new_deaths_per_million: @report.new_deaths_per_million, new_tests: @report.new_tests, new_tests_per_thousand: @report.new_tests_per_thousand, tests_units: @report.tests_units, total_cases: @report.total_cases, total_cases_per_million: @report.total_cases_per_million, total_deaths: @report.total_deaths, total_deaths_per_million: @report.total_deaths_per_million, total_tests: @report.total_tests, total_tests_per_thousand: @report.total_tests_per_thousand } }
    assert_redirected_to report_url(@report)
  end

  test "should destroy report" do
    assert_difference('Report.count', -1) do
      delete report_url(@report)
    end

    assert_redirected_to reports_url
  end
end
