require "httparty"

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @hero = {
      headline: "Discover new ways to win with tech products.",
      subhead: "I'm Colin, a seasoned product marketer and developer.",
      cta: "Contact Me",
      url: "mailto:colin@colinstrachan.com",
      cover: "cs-bg-2.jpg"
    }
    @socials = {
      github_url: "https://www.github.com/colinstrachan",
      github_icon: "github-white-200.png",
      github_name: "GitHub",
      linkedin_url: "https://www.linkedin.com/in/colinstrachan",
      linkedin_icon: "linkedin-white-200.png",
      linkedin_name: "LinkedIn"
    }
    @bio = {
      title: "Fifteen years of technical marketing, rooted in developer experience.",
      content: "After four years learning the art of storytelling in a fast-paced local newsroom, I found new passion and energy in building and marketing tech products. Most of my experience has been in technical product marketing, bringing world-leading AI, analytics and low-code developer tools to market. Over a span of ten years on Montreal's tech scene, I've helped to grow start-ups by leading product launches and driving adoption. Six years' experience as a full-stack developer has also given me strong technical literacy, and experience building web applications with up to 100,000 monthly active users.",
      avatar: "colin-strachan.jpg"
    }
  end

  private

  def get_from_strapi(section, element)
  end
end
