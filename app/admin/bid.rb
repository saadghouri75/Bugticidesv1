ActiveAdmin.register PropertyBid do
  permit_params :active, :user_id, :property_id, :bid
  scope("Active") { |bid| bid.where(active: true) }
  scope("Inactive(3 days earlier)") { |bid| bid.where(active: false) }

  index do
    column "Property" do |p|
    	p.property.title
    end
    column "User" do |p|
    	p.property.user.email
    end
    column :bid
    actions
  end

  action_item only: :index do
    link_to 'Refresh Bids', refresh_bids_admin_property_bids_path
  end

  collection_action :refresh_bids, :method=>:get do
  end

  controller do

  	

  	def refresh_bids
  	  @bids = PropertyBid.where('created_at < ?', 3.days.ago)
  	  @bids.each do |b|
  	  	b.active = false
  	  	b.save
  	  end
  	  redirect_to admin_property_bids_path, :notice => 'Bids refreshed.'
  	end
  end

end