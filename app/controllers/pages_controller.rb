require "httparty"

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    richtext = HTTParty.get('http://localhost:1337/api/homepages/1')
  end
end
