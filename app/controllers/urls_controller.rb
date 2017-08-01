class UrlsController < ApplicationController
  def index
    render json: Url.all
  end

  def create
    @params = params.require(:url).permit(:origin)
    url = Url.create_with_visit(@params)
    if url.make_it_shorten
      render json: url
    else
      render json: {error: "save url failed"}
    end
  end

  def parse
    str = params[:shorten_url]
    u = Url.find_by_shorten(str)
    if u
      u.visit.increment
      redirect_to u.origin
    else
      render json: {error: "cannot find shorten url"}
    end
  end
end
