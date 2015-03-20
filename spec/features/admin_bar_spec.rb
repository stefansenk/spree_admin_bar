require 'spec_helper'

def sign_in_as_admin!
  user = create(:admin_user)
  visit '/login'
  fill_in 'Email', with: user.email
  fill_in 'Password', with: 'secret'
  click_button 'Login'
end


feature 'homepage admin bar' do
  scenario "an admin user can navidate to the admin" do
    sign_in_as_admin!
    visit '/'
    within('#admin_bar'){ click_link 'Admin' }
    current_path.should == spree.admin_path
  end
  scenario "does not allow a regular user to navigate to the admin" do
    visit '/'
    page.should_not have_content('Admin')
  end
end

feature 'taxons admin bar' do
  let!(:taxonomy) { create(:taxonomy, name: "Category") }
  let!(:taxon) { taxonomy.root.children.create(name: "Clothing", taxonomy_id: taxonomy.id) }
  context "an admin user" do
    before do
      sign_in_as_admin!
      visit '/'
      click_link 'Clothing'
    end
    scenario "can navigate to edit the taxonomy in the admin" do
      within('#admin_bar'){ click_link 'Edit Taxonomy' }
      current_path.should == spree.edit_admin_taxonomy_path(taxonomy)
    end
    scenario "can navigate to edit the taxon in the admin" do
      within('#admin_bar'){ click_link 'Edit Taxon' }
      current_path.should == spree.edit_admin_taxonomy_taxon_path(taxonomy.id, taxon.id)
    end
  end
  scenario "does not allow a regular user to navigate to the admin" do
    visit '/'
    click_link 'Clothing'
    page.should_not have_content('Edit Taxonomy')
    page.should_not have_content('Edit Taxon')
  end
end

feature 'products admin bar' do
  let!(:product) { create(:product, name: "Superman T-Shirt") }
  context "an admin user" do
    before do
      sign_in_as_admin!
      visit '/'
      click_link 'Superman T-Shirt'
    end
    scenario "can navigate to edit the product in the admin" do
      within('#admin_bar'){ click_link 'Edit Product' }
      page.should have_content('Editing Product')
      current_path.should == spree.edit_admin_product_path(product)
    end
    scenario "allows an admin user to edit product images in the admin" do
      within('#admin_bar'){ click_link 'Images' }
      current_path.should == spree.admin_product_images_path(product)
    end
    scenario "allows an admin user to edit variants in the admin" do
      within('#admin_bar'){ click_link 'Variants' }
      current_path.should == spree.admin_product_variants_path(product)
    end
    scenario "allows an admin user to edit properties in the admin" do
      within('#admin_bar'){ click_link 'Properties' }
      current_path.should == spree.admin_product_product_properties_path(product)
    end
    scenario "allows an admin user to delete the product" do
      product.reload.deleted_at.should be_nil
      within('#admin_bar'){ click_link 'Delete Product' }
      product.reload.deleted_at.should_not be_nil
    end
    scenario "allows an admin user to edit related products in the admin" do
      within('#admin_bar'){ click_link 'Related' }
      current_path.should == spree.related_admin_product_path(product)
    end
  end
  scenario "does not allow a regular user to navigate to the admin" do
    visit '/'
    click_link 'Superman T-Shirt'
    page.should_not have_content('Edit Product')
  end
end

# feature 'pages admin bar' do
#   let!(:content_page) { Spree::Page.create!(slug: '/page2', title: 'TestPage2', body: 'Body2', visible: true) }
#   scenario "an admin user can navidate to edit the page in the admin" do
#     sign_in_as_admin!
#     visit '/page2'
#     within('#admin_bar'){ click_link 'Edit Page' }
#     current_path.should == spree.edit_admin_page_path(content_page)
#   end
#   scenario "does not allow a regular user to navigate to the admin" do
#     visit '/page2'
#     page.should_not have_content('Edit Page')
#   end
# end
