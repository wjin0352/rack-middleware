# Rack Middleware is a filter that can be used to intercept a request and alter the response
# as a request is made to an application.  Middleware gives you a way to compose Rack
# apps together.  A middleware is simply a Rack app that gets initialized with another Rack
# app.  you can define different middleware to do different jobs and stack them together
# to do useful things.

class DownWords
  # our class will be initialized with another Rack app
  def initialize(app)
    @app = app
  end

  def call(env)
    # First, call '@app'
    status, headers, body = @app.call(env)

    # Iterate through the body, upcasing each part
    words = body.map { |part| part.downcase }

    # Pass our new body on through
    [status, headers, words ]
  end

end




class HelloTurnToTech
  def self.call(env)
    [ 200,                            # 200 indicates success
    {"Content-Type" => "text/plain"}, # the hash of headers
    ["Hello from turntotech"]         # we wrap the body in an Array so it
                                      # responds to 'each' and we can loop though it.
      ]
  end

end
# rack is the HTTP interface for Ruby, its a standard interface for interacting with HTTP and connecting
# to web servers.  It is a web server interface, a protocol for building and making web apps,
# and a collection of middleware utilities.
# A rack application is a Ruby object not a class, that responds to a call method.
# it takes one argument, the environment and returns an ARRAY of 3 values exactly.
# The Status, Headers, and the Body
# status is the http status code, body is the actual body of the response(html u wanna display)
# the body must respond to each.

use DownWords # Tell Rack to use our newly-minted middleware


# tell Rack what to run our app, and then go to localhost:9292 to see output
run HelloTurnToTech























