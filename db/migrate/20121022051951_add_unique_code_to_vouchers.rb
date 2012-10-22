class AddUniqueCodeToVouchers < ActiveRecord::Migration
  def change
    add_column :vouchers, :code, :string
  end
end
