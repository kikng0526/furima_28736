class ManagementsController < ApplicationController
  def index
    @managements = Management.all
  end
end
