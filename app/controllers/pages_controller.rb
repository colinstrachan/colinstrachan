require "httparty"

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @hero = {
      headline: HTTParty.get('http://localhost:1337/api/homepage?populate=*')['data']['attributes']['hero']['headline'],
      subhead: HTTParty.get('http://localhost:1337/api/homepage?populate=*')['data']['attributes']['hero']['subhead'],
      cta: HTTParty.get('http://localhost:1337/api/homepage?populate=*')['data']['attributes']['hero']['cta'],
      url: HTTParty.get('http://localhost:1337/api/homepage?populate=*')['data']['attributes']['hero']['url'],
      cover: HTTParty.get('http://localhost:1337/api/homepage?populate=*&populate=hero.cover')['data']['attributes']['hero']['cover']['data']['attributes']['url']
    }
    @socials = {
      github_url: HTTParty.get('http://localhost:1337/api/socials?populate=*')['data'][0]['attributes']['url'],
      github_icon: HTTParty.get('http://localhost:1337/api/socials?populate=*')['data'][0]['attributes']['icon']['data']['attributes']['url'],
      github_name: HTTParty.get('http://localhost:1337/api/socials?populate=*')['data'][0]['attributes']['name'],
      linkedin_url: HTTParty.get('http://localhost:1337/api/socials?populate=*')['data'][1]['attributes']['url'],
      linkedin_icon: HTTParty.get('http://localhost:1337/api/socials?populate=*')['data'][1]['attributes']['icon']['data']['attributes']['url'],
      linkedin_name: HTTParty.get('http://localhost:1337/api/socials?populate=*')['data'][1]['attributes']['name']
    }
    @bio = {
      title: HTTParty.get('http://localhost:1337/api/homepage?populate=*&populate=bio.avatar')['data']['attributes']['bio'][0]['title'],
      content: HTTParty.get('http://localhost:1337/api/homepage?populate=*&populate=bio.avatar')['data']['attributes']['bio'][0]['content'],
      avatar: HTTParty.get('http://localhost:1337/api/homepage?populate=*&populate=bio.avatar')['data']['attributes']['bio'][0]['avatar']['data']['attributes']['url']
    }
  end

  private

  def get_from_strapi(section, element)
  end
end
