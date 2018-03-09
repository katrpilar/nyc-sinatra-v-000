class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @landmarks = @figure.landmarks
    @titles = @figure.titles
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/edit'
  end


  post '/figures' do
    @figure = Figure.create(name: params[:figure][:name])
    #binding.pry

    if !params[:title][:name].empty?
      @figure.title_ids = params[:figure][:title_ids]
      @title = Title.create(name: params[:title][:name])
      @title.save
      @figure.titles << @title
      #binding.pry
    else
      @figure.title_ids = params[:figure][:title_ids]
    end

    if !params[:landmark][:name].empty?
      @figure.landmark_ids = params[:figure][:landmark_ids]
      @landmark = Landmark.create(name: params[:landmark][:name])
      @landmark.save
      @figure.landmarks << @landmark
    else
      @figure.landmark_ids = params[:figure][:landmark_ids]
    end

    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(name: params[:figure][:name]) unless params[:figure][:name].empty?

    if !params[:title][:name].empty?
      @figure.title_ids = params[:figure][:title_ids]
      @title = Title.create(name: params[:title][:name])
      @title.save
      @figure.titles << @title
      #binding.pry
    else
      @figure.title_ids = params[:figure][:title_ids]
    end

    if !params[:landmark][:name].empty?
      @figure.landmark_ids = params[:figure][:landmark_ids]
      @landmark = Landmark.create(name: params[:landmark][:name])
      @landmark.save
      @figure.landmarks << @landmark
    else
      @figure.landmark_ids = params[:figure][:landmark_ids]
    end

    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

end
