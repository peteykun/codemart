ActiveAdmin.register Program do
  permit_params :name, :statement, :input, :output, :reward
  config.sort_order = 'id_asc'

  index do
    column :id
    column :name
    column :reward
    column :user_id do |program|
      if program.user
        link_to program.user.username, program.user
      end
    end
    default_actions
  end

  show do |program|
    attributes_table do
      row :name
      row :statement do
        raw BlueCloth.new(program.statement).to_html
      end
      row :input do
        simple_format program.input
      end
      row :output do
        simple_format program.output
      end
      row :reward
      row :user_id
    end
  end

  form do |f|
    f.inputs "Problem Details" do
      f.input :name
      f.input :statement
      f.input :input
      f.input :output
      f.input :reward
    end
    f.actions
  end
  
end
