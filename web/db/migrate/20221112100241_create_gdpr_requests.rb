class CreateGdprRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :gdpr_requests do |t|
      t.string :request_type
      t.text :request_json
      t.timestamps
    end
  end
end
