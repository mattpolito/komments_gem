module Komments
  class Railtie < Rails::Railtie
    initializer "komments" do |app|
      ActiveSupport.on_load(:action_view) do
        require 'komments/view_helpers'
        ::ActionView::Base.send :include, ViewHelpers
      end
    end
  end
end
