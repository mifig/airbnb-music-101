class SalesController < ApplicationController
  def create
    @sale = Sale.new
  end
end
