class Router
  attr_reader :routes

  def initialize(routes)
    @routes = routes
  end

  def resolve(env)
    path = env['REQUEST_PATH']

    if routes.key?(path)
      controller(routes[path]).call
    else
      Controller.new.not_found
    end
  rescue Exception => error
    puts error.message
    puts error.backtrace
    Controller.new.internal_error
  end

  private

  def controller(value)
    name, action = value.split('#')
    klass = Object.const_get "#{name.capitalize}Controller"
    klass.new(name: name, action: action.to_sym)
  end
end