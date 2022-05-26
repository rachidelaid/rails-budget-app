require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it { should belong_to :user }
  it { should belong_to :category }
  it { should validate_presence_of :name }
  it { should validate_presence_of :amount }
end
