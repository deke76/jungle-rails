class Admin::DashboardController < ApplicationController

  include HttpAuthConcern

  def show
    @categories = Category.all
    @products = Product.all
  end
end