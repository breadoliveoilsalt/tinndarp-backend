class HomeController < ApplicationController

  def main
    # render text: "got to home controller"
    render :json => {:status => "Made it to the HomeController"}
  end

end
