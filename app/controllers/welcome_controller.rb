class WelcomeController < ApplicationController
    before_action :set_color

  def index
    @homeland = 'US'
    @countries = ["Germany", "Spain", "Peru"]
    @countries = []
    Destination.all.each do |destination|
        @countries << destination.country
      end
    @countries.uniq!
    @photos = ["image_1.JPG", "image_2.JPG", "image_3.JPG", "image_4.JPG"]
    @message = params[:message]
    @background = params[:background]
    @welcome = params[:welcome]
    @margin = params[:margin]
    @united_states = {"capital city" => "Washington, DC", 
                      "favorite city" => "Charleston, SC", 
                      "favorite state" => "Georgia", 
                      "flag colors" => ["red", "white", "blue"]}
    @family = my_family
  end  

  def about
    @color = session[:color]
    @size = params[:size].to_i
    @welcome = params[:welcome]
  end

  def contact
    @color = session[:color]
  end

  private
  def my_family
    {"Thomas" => "Husband", "Sarah" => "Daughter", "Daniel" => "Son", "Hannah" => "Daughter", "Josiah" => "Son", "Matthew" => "Son", "Ezra" => "Son"}
    
  end
  def set_color
    # check param for new color from user
    # if there is a new color in params, set it in session
    @color = params[:color]
    if @color
    session[:color] = @color
    end

    # set @color to be color from params (if there is one)
    # otherwise set @color from the sessions
    if params[:color]
    else
        @color = session[:color]
    end
  end
end

