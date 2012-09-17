class PartnerPresenter < BasePresenter
  presents :partner

  def image
    h.content_tag :div, "Company Image", :class => "company-img"
  end

  def contact_name
    html = h.content_tag :span, h.t('label.contact_name'), :class => "label"
    html += " #{partner.contact_name}"
  end

  def contact_email
    html = h.content_tag :span, h.t('label.contact_email'), :class => "label"
    html += " "
    html += h.mail_to partner.contact_email 
  end
  
  def address
    a = partner.address1 + "<br />"
    a += partner.address2 + "<br />" unless partner.address2.nil?
    a += partner.city + ", " + partner.state + " " + partner.zip_code + "<br />"
    a += h.t('label.phone') + ": " + partner.phone + "<br />" unless partner.phone.nil?
    a += h.t('label.fax') + ": " + partner.fax + "<br />" unless partner.fax.nil?
    a.html_safe
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
