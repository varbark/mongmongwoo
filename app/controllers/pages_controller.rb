class PagesController < ApplicationController
  def front
    redirect_to admin_root_path if current_manager
  end
end