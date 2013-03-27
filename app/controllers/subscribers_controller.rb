class SubscribersController < ApplicationController
	def create 
		h = Hominid::API.new('e26c9dfbde7ae07631eae4ca5fa13a1d-us6')
		puts "Lists for mail chimp" + h.lists.to_s
		puts "Model data" + params[:subscriber][:email]
		h.list_subscribe('c9b909b0b5', params[:subscriber][:email], {}, 'html', false, true, true, false)

		@subscriber = Subscriber.new(params[:subscriber])
		if @subscriber.save
			redirect_to root_url, notice: "Thank you for signing up!"
		else
			redirect_to root_url, notice: "Error signing up"
		end
	end
end