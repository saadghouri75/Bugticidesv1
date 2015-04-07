ActiveAdmin.register Property do
  permit_params :title, :description, :area, :postal_code, :city, :province, :image, :image2, :image3,:image4, :property_type, :size, :price_min, :price_max, :age, :status, :sold_at, :approved, :user_id, :sold_flag, :facilities => []
  index do
    column :title
    column :description
    column :area
    column :postal_code
    column :city
    column :province
    column "Owner" do |p|
      p.user.email
    end
    column :property_type
    column :size
    column :price_min
    column :price_max
    column :age
    column :status
    column :approved
    column :facilities
    actions
    actions defaults: false do |p|
      if p.status == 'open'
        link_to 'Mark Sold', sold_admin_property_path(p), :method => :put
      end
    end
    actions defaults: false do |p|
      if p.approved == false
        link_to 'Mark Approve', approve_admin_property_path(p), :method => :put
      else
        link_to 'Mark Not Approved', disapprove_admin_property_path(p), :method => :put
      end
    end
  end

  before_save do |p|
    f = params[:property][:facilities].reject(&:blank?)
    p.facilities = f.join(", ")
  end

  before_update do |p|
    f = params[:property][:facilities].reject(&:blank?)
    p.facilities = f.join(", ")
  end

  action_item only: :index do
    link_to 'Refresh Properties', refresh_prop_admin_properties_path
  end

  form do |f|
    inputs 'Property' do
      input :title
      input :description
      input :province, as: :select, :collection => Province.all.map{|m| [m.name, m.name]}
      input :city, as: :select, :collection => City.where(:province => 'QC').map{|m| [m.name, m.name]}, :wrapper_html => {:id => 'QC'}
      input :city, as: :select, :collection => City.where(:province => 'ON').map{|m| [m.name, m.name]}, :wrapper_html => {:id => 'ON'}
      input :area, as: :select, :collection => Area.where(:city => 'Montreal').map{|m| [m.name, m.name]}, :wrapper_html => {:id => 'montreal'}
      input :postal_code
      input :image
      input :image2
      input :image3
      input :image4
      input :user
      input :property_type, as: :select, :collection => ['Residential', 'Condo', 'Commercial']
      input :size
      input :price_min
      input :price_max
      input :age
      input :facilities, as: :check_boxes, :collection => ["Hospitals", "Shopping Malls", "Schools", "Public Transport", "Parks", "Others"]
    end
    actions
  end

  member_action :sold, :method=>:put do
  end

  member_action :approve, :method=>:put do
  end

  member_action :disapprove, :method=>:put do
  end

  collection_action :refresh_prop, :method=>:get do
  end

  controller do
 
    def sold
      @property = Property.find(params[:id])
      @property.sold_at = DateTime.now
      @property.status = 'sold'
      @property.save
      redirect_to admin_properties_path, :notice => 'Property marked as sold.'
    end

    def approve
      @property = Property.find(params[:id])
      @property.approved = true
      @property.save
      redirect_to admin_properties_path, :notice => 'Property marked as approved.'
    end

    def disapprove
      @property = Property.find(params[:id])
      @property.approved = false
      @property.save
      redirect_to admin_properties_path, :notice => 'Property marked as not approved.'
    end
    
    def refresh_prop
      @properties = Property.where('status = ? AND sold_at < ?','open',15.days.ago)
      @properties.each do |p|
        p.sold_flag = true
        p.save
      end
      redirect_to admin_properties_path, :notice => 'Properties refreshed.'
    end

  end

end