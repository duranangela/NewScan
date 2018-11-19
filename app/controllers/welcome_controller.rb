class WelcomeController < ApplicationController

  def index
    @topic = params[:topic] || ""
    if (params[:from_date] == '') || (!params[:from_date])
      params[:from_date] = (Date.today - 3)
    end
    if (params[:to_date] == '') || (!params[:to_date])
      params[:to_date] = Date.today
    end
    @from_date = params[:from_date] || ""
    @to_date = params[:to_date] || ""
    @presenter = ArticleService.new(params[:topic], @from_date, @to_date)
  end

end
