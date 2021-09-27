class UnsplashService
  class << self
    def get_images(location)
      response = connection.get("/search/photos?client_id=#{ENV['UPSPLASH_KEY']}&query=#{location}")
      JSON.parse(response.body, symbolize_names: true)
    end

    def connection
      Faraday.new('https://api.unsplash.com')
    end
  end
end
