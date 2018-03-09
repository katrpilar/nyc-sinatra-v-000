class FiguresController < ApplicationController

  get '/figures/new' do
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/show'
  end

  post '/figures' do
    @figure = Figure.create(name: params[:figure][:name])
    #binding.pry

    if !params[:title][:name].empty?
      @figure.title_ids = params[:figure][:title_ids]
      @title = Title.create(name: params[:title][:name])
      @figure.title_ids << @title.id
    else
      @figure.title_ids = params[:figure][:title_ids]
    end

    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

end
