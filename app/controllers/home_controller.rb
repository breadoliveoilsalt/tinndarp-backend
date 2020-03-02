class HomeController < ApplicationController

  def main
    render :json => { :welcome => "Welcome to TINNDARP backend" }
  end

end
