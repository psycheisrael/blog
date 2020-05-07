require 'rails_helper'
RSpec.describe "OrdersControllers", type: :request do
  describe "get orders_path" do
    it "renders the index view" do
      FactoryBot.create_list(:order, 10)
      get orders_path
      expect(response.status).to eq(200)
    end
  end
  describe "get orders_path" do
    it "renders the :show template" do
      order = FactoryBot.create(:order)
      get order_path(id: order.id)
      expect(response.status).to eq(200)
    end
    #it "redirects to the index path if the customer id is invalid" do
    #  get orders_path(id: 5000) #an ID that doesn't exist
    #  expect(response).to redirect_to orders_path
  #end
  end
  describe "get new_orders_path" do
    it "renders the :new template" do
      #order = FactoryBot.create(:order)
      get new_order_path
      expect(response.status).to eq(200)
    end
  end
  describe "get edit_orders_path" do
    it "renders the :edit template" do
      order = FactoryBot.create(:order)
      get order_path(id: order.id)
      expect(response.status).to eq(200)
    end
  end
  describe "post orders_path with valid data" do
    it "saves a new entry and redirects to the show path for the entry" do
      order_attributes = FactoryBot.attributes_for(:order)
      expect { post orders_path, params: {order: order_attributes}
    }.to change(Order, :count)
      expect(response).to redirect_to order_path(id: Order.last.id)
    end
  end
  describe "post orders_path with invalid data" do
    it "does not save a new entry or redirect" do
      order_attributes = FactoryBot.attributes_for(:order)
      order_attributes.delete(:product_name)
      expect { post orders_path, params: {order: order_attributes}
    }.to_not change(Order, :count)
      expect(response.status).to eq(200)
    end
  end
  describe "put order_path with valid data" do
    it "updates an entry and redirects to the show path for the order" do
      order = FactoryBot.create(:order)
      put order_path(id: order.id), params: {order: {product_count: 4}}
      order.reload
      expect(order.product_count).to eq(4)
      expect(response.status).to redirect_to order_path(id: order.id)
    end
  end
  describe "put order_path with invalid data" do
    it "does not update the customer record or redirect" do
      order = FactoryBot.create(:order)
      put order_path(id: order.id), params: {order: {product_name: ""}}
      order.reload
      expect(order.product_name).to_not eq("")
      expect(response.status).to eq(200)
    end
  end
  describe "delete a order record" do
    it "deletes a order record" do
      order = FactoryBot.create(:order)
      expect { delete order_path(id: order.id)
      }.to change(Order, :count)
      expect(response.status).to redirect_to orders_path
    end
  end
end
