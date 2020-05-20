class UsersController < ApplicationController
  # GET /users
  def index
    cache = ActiveSupport::Cache::RedisCacheStore.new(url: "redis://127.0.0.1:6379/0")
    data = cache.fetch("malicious", raw: true) {params[:new]}

    render json: {"user": data}
  end
end
