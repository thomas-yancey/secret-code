class AlgorithmsController < ApplicationController

  def show
    binding.pry
    @algorithm = Algorithm.find(1)
  end
end
