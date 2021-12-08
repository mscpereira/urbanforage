module ApplicationHelper
  include Pagy::Frontend


  def link_to_back(vibes)
    link_to "Back", restaurants_path("vibe-1": vibes[0], "vibe-2": vibes[1], "vibe-3": vibes[2],
      "vibe-4": vibes[3],"vibe-5": vibes[4],"vibe-6": vibes[5]), class:"btn btn-outline-primary mb-3"
  end
end
