class ParksController < ApplicationController
  before_action :set_rangers, only: [:new, :create, :edit, :update]
  before_action :set_park, only: [:show, :edit, :update, :destroy]

  # GET /parks
  def index
    @parks = Park.all
  end

  # GET /parks/1
  def show
  end

  # GET /parks/new
  def new
    @park = Park.new
    # we can add an empty new ranger to the collection using build
    @park.rangers.build
  end

  # GET /parks/1/edit
  def edit
    @park.rangers.build
  end

  # POST /parks
  def create
    # new park is assigned to current_user
    @park = Park.new(park_params)

    upload_file
    if @park.save
      delete_old_file
      redirect_to @park, notice: 'Park was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /parks/1
  def update
    upload_file
    if @park.update(park_params)
      delete_old_file
      redirect_to @park, notice: 'Park was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /parks/1
  def destroy
    delete_old_file @park.picture
    @park.destroy
    redirect_to parks_url, notice: 'Park was successfully destroyed.'
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_park
      @park = Park.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def park_params
      params.require(:park).permit(:name, :description, :picture, rangers_attributes: [:id, :name, :_destroy])
    end

    def set_rangers
      @rangers = Ranger.all
    end

    def upload_file
      # upload file if specified in params
      if params[:park][:picture].present?
        if @park.valid?
          # only save if the Park is valid to improve performance
          uploaded_file = params[:park][:picture].path
          cloudnary_file = Cloudinary::Uploader.upload(uploaded_file)
          # save the reference to the old file and assign the new file to the instance
          @old_file = @park.picture
          @park.picture = cloudnary_file['public_id']
        end
        #remove image from the hash so we don't accidently use it
        params[:park].delete :picture
      end
    end

    def delete_old_file old_file = nil
      # was a file id passed in, if not check in an instance variable
      file_to_del = old_file || @old_file
      # if we had a previous file then delete it
      Cloudinary::Uploader.destroy(file_to_del, :invalidate => true) unless file_to_del.blank?
    end
end
