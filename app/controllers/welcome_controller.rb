class WelcomeController < ApplicationController
  def index
    @subdomain = request.subdomain
  end
end
