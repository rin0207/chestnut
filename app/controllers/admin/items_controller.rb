class Admin::ItemsController < ApplicationController
	def index
		@items = Item.all
	end

	def new
		@item = Item.new
	end

	def crete
		@item = Item.new(item_params)
		@items = Item.all
		if @item.save
			redirect_to admin_items_path
		else
			redirect_back(fallback_location: admin_items_path)
		end
	end

	def index
		@items = Item.find(params[:id])
	end
end
