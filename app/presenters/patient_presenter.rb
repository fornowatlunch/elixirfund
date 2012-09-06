class PatientPresenter
  def initialize(patient, template)
    @patient, @template = patient, template
  end

  def h
    @template
  end

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

  def link_to
    h.link_to @patient.email, h.patient_path(@patient)
  end
end
