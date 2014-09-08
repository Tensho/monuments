require 'rails_helper'

describe User do
  it { is_expected.to respond_to(:authenticate) }
end
