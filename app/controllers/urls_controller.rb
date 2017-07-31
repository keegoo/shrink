class UrlsController < ApplicationController
  def index
    render json: Url.all
  end

  def create
    @params = params.require(:url).permit(:origin)
    url = Url.create(@params)
    if url.make_it_shorten
      render json: url
    else
      render json: {error: "save url failed"}
    end
  end
end
