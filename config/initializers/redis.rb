require 'redis'

uri = URI.parse("redis://127.0.0.1:6379/#{Rails.env.development? ? 0 : 1}")
Redis.current = Redis.new(host: uri.host, port: uri.port, password: uri.password, thread_safe: true)
