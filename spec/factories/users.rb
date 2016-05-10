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
#  admin           :boolean          default(FALSE)
#

FactoryGirl.define do
  factory :user do
    sequence(:name) {|n| "Person #{n}"}
    sequence(:email) {|n| "person_#{n}@example.com"}
    password 'foobar'
    password_confirmation 'foobar'

    factory :admin do
      admin true
    end
  end

end
