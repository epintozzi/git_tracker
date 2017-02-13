class Api::V1::CommitsController < ApplicationController

  def create
    @commit = Commit.new
    @commit.sha = params["head_commit"]["id"][0, 7]
    @commit.message = params["head_commit"]["message"]
    @commit.user = params["head_commit"]["author"]["username"]
    @commit.timestamp = params["head_commit"]["timestamp"]
    if @commit.save
      render json: @commit, status: 200
    else
      render status: 404
    end
  end

end
