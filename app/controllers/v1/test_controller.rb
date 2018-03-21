class V1::TestController < ApplicationController
	
	def index
		@test_items = TestItem.all
		render json: @test_items, status: :ok	
	end

	# POST /projects
  def create
    @project = TestItem.new(project_params)

    if @project.save
      render json: @project, status: :created
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end
  private
  	# Use callbacks to share common setup or constraints between actions.
    def set_test_item
      @project = TestItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def project_params
      params.permit(:name, :date)
    end
end
=begin
1xx Informational
100 :continue
101 :switching_protocols
102 :processing

2xx Success
200 :ok
201 :created
202 :accepted
203 :non_authoritative_information
204 :no_content
205 :reset_content
206 :partial_content
207 :multi_status
226 :im_used

3xx Redirection
300 :multiple_choices
301 :moved_permanently
302 :found
303 :see_other
304 :not_modified
305 :use_proxy
307 :temporary_redirect

4xx Client Error
400 :bad_request
401 :unauthorized
402 :payment_required
403 :forbidden
404 :not_found
405 :method_not_allowed
406 :not_acceptable
407 :proxy_authentication_required
408 :request_timeout
409 :conflict
410 :gone
411 :length_required
412 :precondition_failed
413 :request_entity_too_large
414 :request_uri_too_long
415 :unsupported_media_type
416 :requested_range_not_satisfiable
417 :expectation_failed
422 :unprocessable_entity
423 :locked
424 :failed_dependency
426 :upgrade_required

5xx Server Error
500 :internal_server_error
501 :not_implemented
502 :bad_gateway
503 :service_unavailable
504 :gateway_timeout
505 :http_version_not_supported
507 :insufficient_storage
510 :not_extended
=end