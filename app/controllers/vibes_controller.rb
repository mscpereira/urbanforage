class VibesController < ApplicationController
  def index
    @vibes = Vibe.all
    @photos = ["https://images.unsplash.com/photo-1494346480775-936a9f0d0877?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=816&q=80"]
  end
end
