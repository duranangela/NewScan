require 'date'

class ArticleService

  def initialize(topic, from_date=(Date.today - 3), to_date=Date.today)
    @topic = topic
    @from_date = from_date
    @to_date = to_date
  end

  def articles
    articles = JSON.parse(response.body, symbolize_names: true)[:articles]
    if articles
      articles = articles.map do |article|
        article = [article[:title], article[:source][:name], article[:url], article[:description], article[:publishedAt]]
        article
      end
    end
    articles
  end

  def response
    Faraday.get("https://newsapi.org/v2/everything", params)
  end

  def params
    {
      q: @topic,
      sortBy: 'publishedAt',
      from: @from_date,
      to: @to_date,
      apiKey: ENV['API_KEY']
    }
  end

  def date
    Date.today - 3
  end

end
