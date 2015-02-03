class WelcomeController < ApplicationController
    before_action :set_color

  def index
    @homeland = 'US'
    @countries = ["Germany", "Spain", "Peru"]
    @dave_tree = {"Steve" => "Dad", "Pamela" => "Mom", "Amy" => "Older Sister", "Misty" => "Middle Sister"}
    @family_tree = {"Thomas" => "Husband", "Daniel" => "Son", "Marybeth" => "Daughter-In-Law", "Arianna" => "Granddaughter"}
    @photos = ["image_1.JPG", "image_2.JPG", "image_3.JPG", "image_4.JPG"]
    @message = params[:message]
    @background = params[:background]
    @welcome = params[:welcome]
    @margin = params[:margin]
    @united_states = {"capital city" => "Washington, DC", "favorite city" => "Charleston, SC", "favorite state" => "Georgia", "flag colors" => ["red", "white", "blue"]}
    
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

