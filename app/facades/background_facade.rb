class BackgroundFacade
  def self.get_location_image(location)
    response = UnsplashService.get_images(location)
    if location.nil? || location.empty?
      return 'Invalid location'
      # rails raise error
    else
      results_data = response[:results][0]
      results_data[:location] = location
      Image.new(results_data)
    end
  end
end
