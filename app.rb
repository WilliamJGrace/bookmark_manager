require 'sinatra/base'
require 'sinatra/flash'
require 'uri'
require './lib/bookmark'
require './database_connection_setup'


class Bookmark_manager < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    "Bookmark manager"
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  post '/bookmarks' do
    if params['url'] =~ /\A#{URI::regexp(['http', 'https'])}\z/
      Bookmark.create(url: params['url'], title: params[:title])
    else
      flash[:notice] = "You must submit a valid URL."
    end
    redirect '/bookmarks'

  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark_id = params[:id]
    erb :'bookmarks/edit'
  end

  patch '/bookmarks/:id' do
    Bookmark.update(id: params[:id], url: params[:url], title: params[:title])
    redirect('/bookmarks')
  end




  run! if app_file == $0
end
