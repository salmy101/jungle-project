class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"] 




  def show
    @num_of_products = Product.count 
    @num_of_categories = Category.count

  end

  def product_count
    @num_of_products = Product.count 
    puts "HELLOOO"
    puts Product.count 
  end
end
