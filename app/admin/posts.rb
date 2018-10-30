ActiveAdmin.register Post do
  permit_params :title, :content, :author_id, :thumbnail

  form partial: 'form'
end
