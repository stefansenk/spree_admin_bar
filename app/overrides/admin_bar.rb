Deface::Override.new(
  :virtual_path => "spree/shared/_footer",
  :name => "admin_bar",
  :insert_after => "footer",
  :partial => "spree/admin_bar/admin_bar",
)