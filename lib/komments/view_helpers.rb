require 'action_view'
require 'komments'

module Komments
  module ViewHelpers
    include ActionView::Helpers::TagHelper

    def komments_script_tag(async = true)
      options = Hash.new
      options[:src] = Komments.website_url

      if async
        options[:async] = 'async'
      else
        options[:defer] = 'defer'
      end

      content_tag(:script, nil, options)
    end
  end
end
