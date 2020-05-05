class MainController < Controller
  def index
    @test = "Some test data"
    @arr = %w(one thwo three)
  end
end