class AddTeamSizeToAgencies < ActiveRecord::Migration[7.1]
  def change
    add_column :agencies, :team_size, :integer, null: false, default: 1
    add_check_constraint :agencies, "team_size > 0", name: "team_size_positive"
  end
end
