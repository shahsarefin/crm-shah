class Customer < ApplicationRecord
    has_one_attached :image
    validates :full_name, presence: true
  
    def self.ransackable_attributes(auth_object = nil)
      # List only the direct attributes of the Customer model that should be searchable
      ["created_at", "email_address", "full_name", "id", "notes", "phone_number", "updated_at"]
    end
  
    def self.ransackable_associations(auth_object = nil)
      # If you don't have other models associated with Customer that you want to include in searches,
      # you can return an empty array to effectively disable searching through associations.
      # Or, if you do have associations you wish to search by, list them here.
      []
    end
      # Custom ransacker to check for the presence of an image
  ransacker :has_image, formatter: proc { |v|
  ids = self.joins(:image_attachment).where(active_storage_attachments: {name: 'image'}).pluck(:id)
  ids = ids.present? ? ids : nil
}, splat_params: true do |parent|
  parent.table[:id]
end
  end
  