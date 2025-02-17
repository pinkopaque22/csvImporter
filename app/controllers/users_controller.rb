class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def import
    file = params[:file]
    CsvImportUsersService.new.call(file)
    redirect_to users_path, notice: "Users Imported"
  end
end
