Deface::Override.new(
  virtual_path: "spree/layouts/spree_application",
  name: "admin_bar",
  insert_after: ".content-container",
  partial: "spree/admin_bar/admin_bar",
)
