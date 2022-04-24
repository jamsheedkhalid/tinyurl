class ApplicationController < ActionController::Base
  include Authentication
  before_action do
    ActiveStorage::Current.host = 'localhost:3000'
  end
end
