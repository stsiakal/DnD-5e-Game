require 'rails_helper'

RSpec.describe MegaSeedJob, type: :job do
  include Workify
  ActiveJob::Base.queue_adapter = :test
  it 'creates a new instance of Equipment if there isnt one' do
    described_class.perform_now
    expect(Equipment.create).to change(Equipment, :count).by(1) if Equipment.count.zero?
  end

  it 'enqueues EndpointJob with the correct arguments' do
    described_class.perform_now
    expect(EndpointJob).to(have_been_enqueued.at_least(:once).on_queue("high").with(url_call[url_call.keys.sample]))
  end
end
