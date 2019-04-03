require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'


class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    @analyzed_text = TextAnalyzer.new(params["user_text"])
binding.pry
    @array = @analyzed_text.text.gsub(/[^a-z]/, '').chars.group_by(&:itself).map { |letter, list| [letter, list.count]}.max_by(&:last)
    erb :results
  end
end
