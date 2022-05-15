require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require_relative 'lib/bookmark'
# require_relative 'lib/comment'
require './database_connection_setup'
require 'uri'

class BookmarkManager < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash
  register Sinatra::Reloader

  get '/' do
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/bookmarks/create' do
    erb :'bookmarks/create'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :'bookmarks/update'
  end

  post '/bookmarks' do
    flash[:notice] = "You must submit a valid URL." unless Bookmark.create(url: params[:bookmark], title: params[:title])
    redirect '/bookmarks'
  end

  patch '/bookmarks/:id' do
    Bookmark.update(url: params[:url], title: params[:title], id: params[:id])
    redirect('/bookmarks')
  end

  get '/bookmarks/:id/comments/new' do
    @bookmark_id = params[:id]
    erb :'bookmarks/comments/new'
  end

  post '/bookmarks/:id/comments' do
    Comment.create(bookmark_id: params[:id], text: params[:comment])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
