class PatientPresenter < BasePresenter
  presents :patient

  def avatar
    if patient.avatar.url.nil?
      h.image_tag 'ghost.png'
    else
      h.image_tag patient.avatar.url
    end
  end

  def name
    w = patient.name.split
    w[0] + " " + w[w.length-1][0]
  end

  def location
    "#{patient.city}, #{patient.state}"
  end

  def public_wishlist_items
    patient.wishlist.products
  end

  def link_to
    h.link_to name, h.patient_path(patient) 
  end
end
