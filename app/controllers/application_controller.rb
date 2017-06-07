require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do
    erb :'create/new'
  end

  post '/posts' do
    @post = Post.create(name:params[:name], content:params[:content])
    erb :'create/index'
  end

  get '/posts' do
    @posts = Post.all
    erb :'read/index'
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :'read/show'
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :'edit/edit'
  end

  patch '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :'edit/show'
  end

  delete '/posts/:id/delete' do
    @post = Post.find_by_id(params[:id])
    @post.delete
    "#{@post.name} was deleted"
  end


end
