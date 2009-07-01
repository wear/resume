class LandingController < ApplicationController 
  include FaceboxRender
             
  def index
    @resumes = Resume.find(:all)
  end
end
