require 'csv'
require 'open-uri'

class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]
  
  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.all
    unless params[:iso_code].blank?
      @reports = @reports.where('lower(iso_code) = ?', params[:iso_code].downcase)
    end
    unless params[:location].blank?
      @reports = @reports.where('lower(location) = ?', params[:location].downcase)
    end
    unless params[:date].blank?
      @reports = @reports.where(date: params[:date])
    end

  end

  def sync
    csv_text = open('https://covid.ourworldindata.org/data/owid-covid-data.csv')
    csv = CSV.parse(csv_text, :headers=>true)
    csv.each do |row|
      p row
      report = Report.find_or_create_by(
        iso_code: row["iso_code"],
        location: row["location"],
        date: row["date"]
      )
      report.update(
        iso_code: row["iso_code"],
        location: row["location"],
        date: row["date"],
        total_cases: row["total_cases"],
        new_cases: row["new_cases"],
        total_deaths: row["total_deaths"],
        new_deaths: row["new_deaths"],
        total_cases_per_million: row["total_cases_per_million"],
        new_cases_per_million: row["new_cases_per_million"],
        total_deaths_per_million: row["total_deaths_per_million"],
        new_deaths_per_million: row["new_deaths_per_million"],
        total_tests: row["total_tests"],
        new_tests: row["new_tests"],
        total_tests_per_thousand: row["total_tests_per_thousand"],
        new_tests_per_thousand: row["new_tests_per_thousand"],
        tests_units: row["tests_units"]
      )
    end
  redirect_to reports_path
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
  end

  # GET /reports/new
  def new
    @report = Report.new
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params)

    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: 'Report was successfully created.' }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url, notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def report_params
      params.require(:report).permit(:iso_code, :location, :date, :total_cases, :new_cases, :total_deaths, :new_deaths, :integer, :total_cases_per_million, :new_cases_per_million, :total_deaths_per_million, :new_deaths_per_million, :total_tests, :new_tests, :total_tests_per_thousand, :new_tests_per_thousand, :tests_units)
    end
end
