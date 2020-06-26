# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Shop, type: :model do
  describe 'Associations' do
    it { should have_many(:products) }
    it { should have_and_belong_to_many(:taxons) }
    it { should have_many(:product_taxons).through(:products).source(:taxons) }
  end
end
