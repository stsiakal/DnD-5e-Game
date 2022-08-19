require 'rails_helper'

RSpec.describe TraitsJob, type: :job do
  include Workify
  it 'parses correctly' do

    url_call
  end
end
