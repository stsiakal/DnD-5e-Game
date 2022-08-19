require 'rails_helper'

RSpec.describe EndpointJob, type: :job do
  include Workify
  ActiveJob::Base.queue_adapter = :test

end
