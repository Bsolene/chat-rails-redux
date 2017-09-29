class AddColumnToMessage < ActiveRecord::Migration[5.1]
  def change
    add_reference :messages, :channel, index: true
  end
end
