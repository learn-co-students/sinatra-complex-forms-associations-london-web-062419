class OwnersController < ApplicationController
  #index
  get '/owners' do
    @owners = Owner.all
    erb :'/owners/index' 
  end
  #new
  get '/owners/new' do 
    @pets = Pet.all
    erb :'/owners/new'
  end
  #create
  post '/owners' do 
    @owner = Owner.create(params[:owner])
    if !params["pet"]["name"].empty?
      @owner.pets << Pet.create(name: params["pet"]["name"])
    end
    redirect "/owners/#{@owner.id}" 
  end
  #edit
  get '/owners/:id/edit' do 
    @owner = Owner.find(params[:id])
    @pets = Pet.all
    erb :'/owners/edit'
  end
  #show
  get '/owners/:id' do 
    @owner = Owner.find(params[:id])
    erb :'/owners/show'
  end
  #update
  patch '/owners/:id' do 
    #######bug fix
   if !params[:owner].keys.include?("pet_ids")
    params[:owner]["pet_ids" = []
  end
  #####
  @owner = Owner.find(params[:id])
  @owner.update(params["owner"])
  if !params["pet"]["name"].empty?
    @owner.pets << Pet.create(name: params["pet"]["name"])
  end
  redirect "/owners/#{@owner.id}" 
end