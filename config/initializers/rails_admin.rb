RailsAdmin.config do |config|
  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan, UserAbility

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model Answerpost do
    edit do
      exclude_fields :user, :title
    end
  end

  config.model Aboute do
    edit do
      field :text, :ck_editor
      exclude_fields :aboute_posts
    end
  end

  config.model Article do
    edit do
      field :title
      field :text, :ck_editor
    end
  end

  config.model Filial do
    edit do
      field :title, :ck_editor
      field :text, :ck_editor
    end
  end

  config.model PaymentInfo do
    edit do
      field :title
      field :text, :ck_editor
    end
  end

  config.model Service do
    edit do
      field :title
      field :position
      field :type_service, :enum do
        enum_method do
          :type_service
        end
      end
    end
  end

  config.model Servicetext do
    edit do
      field :title
      field :text, :ck_editor
      field :service_id, :enum do
        enum do
          Service.all.map { |el| [el.title, el.id] }
        end
      end
    end
  end

  config.model SizePay do
    edit do
      field :name, :ck_editor
    end
  end

  config.model SocialService do
    edit do
      field :name
    end
  end

  config.model SocialPost do
    edit do
      field :title
      field :text, :ck_editor
      field :social_service
    end
  end
end
