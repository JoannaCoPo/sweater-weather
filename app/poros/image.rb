class Image
  attr_reader :id,
              :location,
              :image_url,
              :credit
  def initialize(data)
    @id = nil
    @location = data[:location]
    @image_url = data[:urls][:full]
    @credit = author_credit(data)
  end
  #
  def author_credit(data)
    {
      source: 'unsplash.com',
      author: data[:user][:name],
      profile: data[:user][:links][:html]
    }
  end
end
