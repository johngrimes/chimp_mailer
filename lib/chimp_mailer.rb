require 'rubygems'
require 'restclient'
require 'active_support'

class MailChimpError < Exception; end

class MailChimp
  @@api_key = ''
  @@api_version = '1.2'
  @@datacenter = 'us1'
  @@default_options = {:output => :json}
  @@url = "http://#{@@datacenter}.api.mailchimp.com/#{@@api_version}/"

  def self.settings=(settings)
    settings.each do |key, value|
      class_variable_set("@@#{key}".to_sym, value)
      if key == 'api_key'
        @@datacenter = @@api_key.split('-').last
      end
    end
    @@url = "http://#{@@datacenter}.api.mailchimp.com/#{@@api_version}/"
    @@default_options = {:apikey => @@api_key, :output => :json}
  end

  def self.method_missing(name, *args)
    options = args.last.class == Hash ? args.last : {}
    options.merge!(@@default_options)
    options[:method] = name.to_s.camelize(:lower)

    raw_response = RestClient.get("#{@@url}?#{options.to_query}", :accept => :json)

    response = raw_response.class == String ? ActiveSupport::JSON.decode(raw_response) : raw_response
    if response.class == Array
      response.each { |x| x.symbolize_keys! }
    elsif response.class == Hash
      response.symbolize_keys!
      raise MailChimpError, "(#{response[:code] ? response[:code] : 'no code'}) #{response[:error]}" if response[:error]
    end

    return response
  end

  def self.log=(logger)
    RestClient.log = logger
  end
end
