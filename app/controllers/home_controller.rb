class HomeController < ApplicationController

  def main
    # render text: "got to home controller"
    render :json => { :status => "Made it to the HomeController",
                      :new_status => "Successful deploy to Heroku",
                      :extra_status => "Confirm deploy on merging PR, for real this time"}

  end

end
