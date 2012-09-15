class PatientPresenter < BasePresenter
  presents :patient

  def avatar
    h.content_tag :div, "User Avatar", :class => "img"
  end

  def name
    w = patient.name.split
    w[0] + " " + w[w.length-1][0] + "."
  end

  def location
    "#{patient.city}, #{patient.state}"
  end

  def public_wishlist_items
    patient.wishlist.products
  end

  def link_to
  end
end
