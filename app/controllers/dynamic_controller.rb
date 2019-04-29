class DynamicController < ApplicationController
  def welcome
    @first_name = params['first_name']
  end

  def home
    @potins = Potin.all
  end

  def gossip
    id = params['id']
    @gossip = Potin.find(id.to_i)
  end

  def user
    id = params['id']
    @user = User.find(id.to_i)
  end

end