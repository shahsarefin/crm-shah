Rails.application.config.to_prepare do
    ActiveStorage::Current.url_options = {
      protocol: 'http', # Use 'https' in production
      host: 'localhost',
      port: 3000 # Adjust the port to match your development server port
    }
  end
  