class PetsController < ApplicationController
  #index
  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index' 
  end
  #new
  get '/pets/new' do 
    @owners = Owner.all
    erb :'/pets/new'
  end
  #create
  post '/pets' do 
    @pet = Pet.create(params[:pet])
    redirect to "pets/#{@pet.id}"
    if !params["owner"]["name"].empty?
      @pet.owners << Owner.create(name: params["owner"]["name"])
    end
    redirect "/pets/#{@pet.id}" 
  end
  #edit
  get '/pets/:id' do 
    @pet = Pet.find(params[:id])
    @owner = Owner.all
    erb :'/pets/:id'
  end
  #show
  get '/pets/:id' do 
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end
  #update
  patch '/pets/:id' do 
    if !params[:pet].keys.include?("owner_ids")
      params[:pet]["owner_ids" = []
    end
    #####
    @pet = Pet.find(params[:id])
    @pet.update(params["pet"])
    if !params["owner"]["name"].empty?
      @pet.owners << Owner.create(name: params["owner"]["name"])
    end
    redirect to "pets/#{@pet.id}"
  end
end