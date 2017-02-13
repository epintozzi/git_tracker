class Api::V1::CommitsController < ApplicationController

  def create
    payload = JSON.parse(params["payload"])
    @commit = Commit.new
    @commit.sha = payload["head_commit"]["id"][0, 7]
    @commit.message = payload["head_commit"]["message"]
    @commit.user = payload["head_commit"]["author"]["username"]
    @commit.timestamp = payload["head_commit"]["timestamp"]
    if @commit.save
      render json: @commit, status: 200
    else
      render status: 404
    end
  end

end
