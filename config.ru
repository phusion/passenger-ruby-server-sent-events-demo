class Stream
  def each
    5.times do
      yield "data: " + rand(10000).to_s + "\n\n"
      sleep 1
    end
  end
end

app = lambda do |env|
  [200, { "Content-Type" => "text/event-stream;charset=utf-8" }, Stream.new]
end

run app
