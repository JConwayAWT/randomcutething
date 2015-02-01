class StaticsController < ApplicationController

  def index
    offset = rand(Cute.count)
    @original_cute_url = Cute.offset(offset).first.url
  end
  
end