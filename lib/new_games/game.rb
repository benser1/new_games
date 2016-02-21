require 'pry' 

class Game 

  @@all = []

  def self.all 
    @@all 
  end

  def save
    @@all << self 
  end

  def self.find(id) 
    self.all[id.to_i -1]
  end

  def self.doc
    @@doc ||= Nokogiri::HTML(open("http://www.gamestop.com/browse/games/xbox-one?nav=28-xu0,13ffff2418-1e0-5"))
    binding.pry
  end

  def self.product_title
    @@title ||= doc.search(".ats-product-title").collect{|e| e.text}
  end

  def self.price
    @@price ||= doc.search(".ats-product-price").collect{|e| e.text}
  end

  def self.publisher
    @@publisher ||= doc.search(".ats-product-publisher").collect{|e| e.text}
  end





end ## class end