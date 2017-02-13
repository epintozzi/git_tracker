class CommitsController < ApplicationController

  def index
    @commits = Commit.all.order(created_at: :desc).limit(10)
  end

end
