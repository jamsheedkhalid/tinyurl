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

  def destroy
    item = Upload.find(params[:id])
    if item.destroy
      redirect_to root_path, :notice => "File Deleted Successfully!"
    else
      redirect_to root_path, :notice => "Something went wrong!"
    end
  end

  private

  def user_params
    params.require(:upload).permit(:title, :description, :file)
  end

end
