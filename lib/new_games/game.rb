require 'pry' 

class Game 

  attr_accessor :title, :price, :publisher, :date

  @@all = []

  def self.all 
    @@all 
  end

  def save
    @@all << self 
  end

  def self.find(id) 
    self.all[id.to_i - 1]
  end

  def self.doc
    @@doc ||= Nokogiri::HTML(open("http://www.gamestop.com/browse/games/xbox-one?nav=28-xu0,13ffff2418-1e0-5"))
  end

  def self.product_title
    @@title ||= doc.search(".ats-product-title a").collect{|e| e.text}
  end

  def self.game_price
    @@price ||= doc.search(".ats-product-price").collect{|e| e.text}
  end

  def self.game_publisher
    @@publisher ||= doc.search(".ats-product-publisher").collect{|e| e.text}
  end

  def self.release_date
    @@date ||= doc.search(".ats-product-infoList li:first-child").collect{|e| e.text}
  end

  def self.scrape_all
    (0..product_title.size-1).to_a.each do |i|
      title = product_title[i]
      price = game_price[i]
      publisher = game_publisher[i]
      date = release_date[i]

      game = Game.new 
      game.title = title 
      game.price = price 
      game.publisher = publisher
      game.date = date 
      game.save 
    end
  end




end ## class end




















