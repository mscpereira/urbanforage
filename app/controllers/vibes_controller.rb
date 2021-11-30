class VibesController < ApplicationController
  def index
    @vibes = Vibe.all
  end
end
