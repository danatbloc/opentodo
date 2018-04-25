class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token

  private
   def authenticated?
     authenticate_or_request_with_http_basic do |username, password|
       User.where( username: username, password: password).present?
     end
   end

   def authenticated_for_list_index?
     authenticate_or_request_with_http_basic do |username, password|
       user = User.where( username: username, password: password)
       user.present? && (params[:user_id].to_i == user.first.id)
     end
   end

   def authenticated_for_list?
     authenticate_or_request_with_http_basic do |username, password|
       user = User.where( username: username, password: password)
       list = List.find(params[:id])
       user.present? && (params[:user_id].to_i == user.first.id && list.user == user.first)
     end
   end

   def authenticated_for_item_index?
     authenticate_or_request_with_http_basic do |username, password|
       user = User.where( username: username, password: password)
       list = List.find(params[:list_id])
       user.present? && (list.user == user.first)
     end
   end

   def authenticated_for_item?
     authenticate_or_request_with_http_basic do |username, password|
       user = User.where( username: username, password: password)
       list = List.find(params[:list_id])
       user.present? && (list.user == user.first)
     end
   end
end
