class AddUserToExistingEntries < ActiveRecord::Migration[5.0]
  def change
    user = User.first
    Entry.find_each do |entry|
      entry.users << user
    end
  end
end
