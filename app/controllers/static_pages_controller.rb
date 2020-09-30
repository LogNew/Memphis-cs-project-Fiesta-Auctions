class StaticPagesController < ApplicationController
  def home
    respond_to do |format|
      format.html { render :home }
    end
  end
  
  def about
    respond_to do |format|
      format.html { render :about }
    end
  end
  
end
