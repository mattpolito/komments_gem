require 'rails'
require 'komments/view_helpers'

module Komments
  class Railtie < Rails::Railtie
    initializer "komments.action_view" do |app|
      ActiveSupport.on_load(:action_view) do
        include ::Komments::ViewHelpers
      end
    end
  end
end
