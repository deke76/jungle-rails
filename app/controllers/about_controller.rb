class AboutController < ApplicationController
  def index
    @employees = Employee.all
  end
end
