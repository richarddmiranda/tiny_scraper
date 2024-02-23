require 'watir'
require 'open-uri'
require 'nokogiri'

class ChildminderScraper

  attr_accessor :browser

  def initialize
    @browser = Watir::Browser.new
  end

  def home_name
    browser.h1s(class: 'sc-fqkvVR hymgpl').first.text
  end

  def childminder_name
    browser.h2s(class: 'text-15 leading-24 font-bold antialiased text-Purple800 line-clamp-1').first.text
  end

  def location # TODO: get second half
    browser.divs(class: 'ml-5 flex flex-col').first.text
  end

  def price
    browser.ps(class: 'sc-kAyceB bECvgI').first.text
  end

  def ages
    browser.ps(class: 'sc-kAyceB bECvgI')[1].text
  end

  def availability
    browser.ps(class: 'sc-kAyceB bECvgI')[2].text
  end
  
  def opening_hours
    browser.ps(class: 'sc-kAyceB bECvgI')[3].text
  end

  def about_home
    browser.articles(class: 'sc-eqUAAy ProviderAbout__WideArticle-sc-w894f7-1 jZdWfQ fPqEyR')[0].text
  end

  def about_childminder
    browser.articles(class: 'sc-eqUAAy ProviderAbout__WideArticle-sc-w894f7-1 jZdWfQ fPqEyR')[1].text
  end

  def listing_details
    {
      home_name: home_name,
      childminder_name: childminder_name,
      location: location,
      price: price,
      ages: ages,
      availability: availability,
      opening_hours: opening_hours,
      about_home: about_home,
      about_childminder: about_childminder
    }
  end

end

childminder = ChildminderScraper.new





