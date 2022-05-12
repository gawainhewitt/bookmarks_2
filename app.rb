require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/bookmark'

class BookmarkManager < Sinatra::Base
  set :method_override, true # make a note about this and corrosponding in the erb file
  configure :development do
    register Sinatra::Reloader
  end

  get '/bookmarks/create' do
    erb :'bookmarks/create'
  end

  get '/bookmarks/delete' do

    erb :'bookmarks/delete'
  end

  delete '/bookmarks' do
    Bookmark.delete(title: params[:title])
    redirect '/bookmarks'
  end

  post '/bookmarks' do
    Bookmark.create(url: params[:bookmark], title: params[:title])
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  run! if app_file == $0
end
