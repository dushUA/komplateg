# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#  remember_token  :string
#

FactoryGirl.define do
  factory :user do
    name     'Michael Hartl'
    email    'michael@example.com'
    password 'foobar'
    password_confirmation 'foobar'
  end

end
