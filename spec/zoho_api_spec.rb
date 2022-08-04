# frozen_string_literal: true

RSpec.describe ZohoApi do
  it 'has a version number' do
    expect(ZohoApi::Version.from_file).not_to be_empty
  end
end
