class LinksController < ApplicationController
  def show
    @link = Link.find_by_slug(params[:slug])
    if @link.nil?
    redirect_to root_path, :notice => "Wrong URL"
    else
    @link.update_attribute(:clicked, @link.clicked + 1)
    redirect_to @link.url
    end
  end

  def send_email
    puts params[:email]
    puts params[:link]
    UserMailer.send_link(User.find(current_user.id), params[:link],params[:email]).deliver_now
    redirect_to root_path, :notice => "File Sent"
  end
end
