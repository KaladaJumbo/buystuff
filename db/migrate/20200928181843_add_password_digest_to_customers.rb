class AddPasswordDigestToCustomers < ActiveRecord::Migration[5.1]
  def change

    add_column :customers, :passowrd_digest, :string

  end
end
