require "socket"

class TimblClient

  def initialize(host="localhost", port=6060)
    @host = host
    @port = port
    @socket = nil
    connect
  end

  def classify(request)
    @socket.send(format_request(request), 0)
    format_response(@socket.recv(1024))
  end
  alias :tag :classify

  def format_request(request)
    request = "c " + request unless request.start_with?("c ")
    request.chomp + "\n"
  end

  # Turns the Timbl response into a more familiar Ruby-hash.
  # E.g. the response 'CATEGORY {0}\n' is converted to {:category => "0"}
  def format_response(response)
    response.scan(/([A-Z]+) \{ ?(.*?) ?\}/).inject({}) do |res, e|
      res[e[0].downcase.to_sym] = e[1]
      res
    end
  end

  # Open the socket
  def connect
    @socket = TCPSocket.open(@host, @port)
    @socket.gets # consumes the welcome msg
  end

  def disconnect
    @socket.send("exit\n", 0)
    @socket.close
  end
  alias :close :disconnect

end
