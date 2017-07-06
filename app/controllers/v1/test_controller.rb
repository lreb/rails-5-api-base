class V1::TestController < ApplicationController
	
	def index
		@test_items = TestItem.all
		render json: @test_items, status: :ok	
	end

end
