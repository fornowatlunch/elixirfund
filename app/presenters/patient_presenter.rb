class PatientPresenter < BasePresenter
  def name
    @patient.profile.name
  end

  def avatar
    "Unknown"
  end

  def location
    "#{@patient.profile.city}, #{@patient.profile.state}"
  end

  def public_bio
    @patient.profile.public_bio
  end

  def public_wishlist_items
    @patient.wishlist.products
  end
end
