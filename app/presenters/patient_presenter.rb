class PatientPresenter < BasePresenter
  presents :patient

  def avatar
    "Unknown"
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
