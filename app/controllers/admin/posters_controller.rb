class Admin::PostersController < ApplicationController  
  layout 'admin'
  def index   
    @section = 'admin_poster'
    @posters = Poster.find(:all)
  end
end
