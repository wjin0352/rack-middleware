class HelloTurnToTech
  def self.call(env)
    [ 200,                            # 200 indicates success
    {"Content-Type" => "text/plain"}, # the hash of headers
    ["Hello from turntotech"]         # we wrap the body in an Array so it
                                      # responds to 'each' and we can loop though it.
      ]
  end

end

# tell Rack what to run our app
run HelloTurnToTech
