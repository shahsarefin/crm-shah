ActiveAdmin.register Customer do
  # Permit parameters for creating and updating customers
  permit_params :full_name, :phone_number, :email_address, :notes, :image

  # Form configuration
  form do |f|
    f.inputs 'Customer Details' do
      f.input :full_name
      f.input :phone_number
      f.input :email_address
      f.input :notes
      f.input :image, as: :file
    end
    f.actions
  end

  # Display details of a customer including the image
  show do
    attributes_table do
      row :full_name
      row :phone_number
      row :email_address
      row :notes
      row :image do |customer|
        if customer.image.attached?
          image_tag url_for(customer.image), width: '50%'
        else
          text_node "No image attached"
        end
      end
    end
  end

  # Customizing the index page
  index do
    selectable_column
    id_column
    column :full_name
    column :phone_number
    column :email_address
    column :created_at
    actions
  end

  # Filters for searching customers
  filter :full_name
  filter :phone_number
  filter :email_address
  filter :created_at
end
