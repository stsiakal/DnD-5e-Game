class CharacterJob < ApplicationJob
  queue_as :default
  include Workify
  def perform(api)
    # Do something later
  end
end
