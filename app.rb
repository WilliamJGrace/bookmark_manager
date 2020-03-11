require 'sinatra/base'
require './lib/bookmark'

class Bookmark_manager < Sinatra::Base

  get '/' do
    "Bookmark manager"
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  post '/bookmarks' do
    Bookmark.create(url: params['url'], title: params[:title])
    redirect '/bookmarks'
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end





  run! if app_file == $0
end
