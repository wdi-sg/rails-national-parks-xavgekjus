class ParksController < ApplicationController
  def index  #goes to index route in parks
    @parks = Park.all   #Instance variable @parks set here will be available in index.erb file in parks folder
    respond_to do |format|
      format.html    #If standard html get request, will render html
      format.json {render json: @parks}   #if put .json at back when typing url into browser, will render json file instead. THIS IS API!!
    end
  end

  def show #goes to show route in parks
    @park = Park.find(params[:id])

    # byebug    ##If put here, when running show function (by requesting the show page), will stop here and log out.Then can type anything like params , params[:id] to see what is inside

    respond_to do |format|
      format.html
      format.json {render json: @park}
    end

  end

  def new #goes to new route in parks
    #Just get new empty park
    @new_park = Park.new
    #Doesn't make sense to create a form for json, so no respond_to here
  end

  def create
    # byebug
    @new_park = Park.new(park_params)    #Important to be @new_park here, because render of new.html.erb . ALSO, rails cant allow Park.new(params[:park])

    if @new_park.save    # @saving_park.save returns a boolean , i.e. true/false
      respond_to do |format|
        format.html { redirect_to parks_path}
        format.json {render json: {status: 200, message:'Successfully created new park'}}
      # redirect_to parks_path   #better to use parks_path then the actual url
      end
    else
      render 'new'   #render new.html.erb  , NOT GOING TO def new above!!
    end

  end

  def edit
    #get an existing park from params[:id]
    @found_park = Park.find(params[:id])
    #render the bootstrap edit form ##THIS HAS BEEN MAGICALLY RENDERED BY RAILS, no need to render etc.etc.

  end

  def update

    @found_park = Park.update(params[:id],park_params)

    if @found_park.save    # @saving_park.save returns a boolean , i.e. true/false
      respond_to do |format|
        format.html { redirect_to park_path}
        format.json {render json: {status: 200, message:'Successfully updated park'}}
        # redirect_to park_path   #better to use parks_path then the actual url
      end
    else
      render 'edit'   #render edit.html.erb  , NOT GOING TO def edit above!!
    end

    # @updated_park.save
    #send the edit request . Hint: Not post method
    #find an existing park object with the id from form_data
    #save the updated park object
    #if can save, redirect to parks_path
    #else render the edit page
  end

  private

  def park_params
    params.require(:park).permit(:name, :description, :picture)
  end

end
