class Admin::BaseController < ApplicationController
  before_action :ensure_admin
  layout "admin"

  def index
    @agencies_count = Agency.count
    @tags_count = Tag.count
    @users_count = User.count
    @recent_agencies = Agency.order(created_at: :desc).limit(5)
  end
end
