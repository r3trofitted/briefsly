module SlotsHelper
  def available_repositories_for_slot(slot)
    terms = "rails" # SLIME
    Current.github_client.search_repositories(terms).items
  end
end
