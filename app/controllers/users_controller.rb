class UsersController < ApplicationController
  def index
    matching_users = User.all
    @users = matching_users.order(:created_at)

    render({ :template => "user_templates/all_users.html.erb" })
  end

  def show
    username = params.fetch("username")
    matching_users = User.where({ :username => username })
    @user = matching_users.at(0)

    render({ :template => "user_templates/user_details.html.erb" })
  end

  def create
    # insert_user_record?query_username=chichi
    user = User.new
    user.username = params.fetch("query_username")
    user.save

    redirect_to("/users/#{user.username}")
  end

  def update
    # update_user/121?query_username=chichi2
    user_id = params.fetch("user_id")
    matching_users = User.where({ :id => user_id })
    the_user = matching_users.at(0)

    the_user.username = params.fetch("query_username")
    the_user.save
    redirect_to("/users/#{the_user.username}")
  end
end
