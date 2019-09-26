require 'rest_client'

class HttpClient
  cattr_accessor(:client) { RestClient }

  def self.post(*args)
    client.post(*args)
  end
end
