class Client::CartedProductsController < ApplicationController

  def index
    # client_params = {
    #                        product_id: params[:product_id],
    #                        quantity: params[:quantity]
    #                 }
    response = Unirest.get(
                           "http://localhost:3000/api/carted_products"
                           )
    @carted_products = response.body
    render 'index.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    client_params = {
                           product_id: params[:product_id],
                           quantity: params[:quantity]
                    }

    response = Unirest.post(
                            "http://localhost:3000/api/carted_products",
                            parameters: client_params
                            )
    @carted_product = response.body
    # render 'show.html.erb'
    # flash[:success] = "Successfully added to cart"
    redirect_to '/client/carted_products'
  end

  def destroy
    carted_product_id = params[:id]
    response = Unirest.delete("http://localhost:3000/api/carted_products/#{carted_product_id}") #response just holds value of return, action would still work without it
    redirect_to '/client/carted_products'
  end
end
