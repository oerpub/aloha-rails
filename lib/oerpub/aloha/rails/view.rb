module Oerpub
  module Aloha
    module Rails
      module View

        def aloha_rails_editbar
          render :partial => 'oerpub/aloha/rails/cnx-editbar'
        end

      end
    end
  end
end

ActionView::Base.send :include, Oerpub::Aloha::Rails::View
