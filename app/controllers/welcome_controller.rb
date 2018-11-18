class WelcomeController < ApplicationController

  def index
    @presenter = ArticleService.new
  end

end
