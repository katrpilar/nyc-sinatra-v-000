class FiguresController < ApplicationController

  get '/figures/new' do
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/show'
  end

  post '/figures' do
    @figure = Figure.create(name: params[:name])
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

end
