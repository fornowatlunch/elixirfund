ActiveAdmin.register_page "Dashboard" do
  menu :priority => 1
  content :title => proc { I18n.t("active_admin.dashboard") } do

    columns do

      column do
        panel "Last 10 Orders" do

          table_for Order.last(10).collect do |order|
            order.column(:id) { |o| link_to(o.id, admin_order_path(o)) }
            order.column(:date) { |o| o.created_at.to_formatted_s(:long) }
            order.column(:total) { |o| link_to(number_to_currency(o.subtotal), admin_order_path(o)) }
          end
        end
      end

      column do
        panel "Last 10 Registrations" do
          table_for User.last(10).collect do |user|
            user.column(:email) { |u| link_to(u.email, admin_user_path(u)) }
          end
        end
      end

      column do
        panel "Last 10 Patient Profiles created" do
          table_for Patient.last(10).collect do |patient|
            patient.column(:name) { |p| link_to(p.name, admin_patient_path(p)) }
            patient.column(:location) { |p| p.city + ", " + p.state }
          end
        end
      end

    end # columns
  end # columns
end # content