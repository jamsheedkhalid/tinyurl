class UploadsController < ApplicationController
  before_action :authenticate_user!

  def create
    @upload = Upload.create(user_params)
    @user = current_user
    @upload = @user.uploads.create(user_params)
    if @upload.save
      redirect_to root_path, :notice => "File Uploaded Successfully!"
    else
      render :new
    end
  end

  def new
    @upload = Upload.new
  end

  def show
    @uploads = Upload.where(user_id: current_user.id)
  end

  def share
    file = Upload.find(params[:id])
    puts file.id
  end

  def destroy
    file = Upload.find(params[:id])
    if file.destroy
      redirect_to show_uploads_url, :notice => "File Deleted Successfully!"
    else
      redirect_to root_path, :notice => "Something went wrong!"
    end
  end

  private

  def user_params
    params.require(:upload).permit(:title, :description, :file)
  end

end
