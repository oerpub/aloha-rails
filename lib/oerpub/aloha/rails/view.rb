module Oerpub
  module Aloha
    module Rails
      module View

        def oerpub_aloha_rails(selector)
          render :partial => 'oerpub/aloha/rails/embed',
                 :locals => { :selector => selector }
        end

      end
    end
  end
end

ActionView::Base.send :include, Oerpub::Aloha::Rails::View
