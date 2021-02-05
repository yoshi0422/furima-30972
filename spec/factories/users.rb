FactoryBot.define do
  factory :user do
    transient do
      person{ Gimei.name }
    end
    nickname                {Faker::Name.name}
    email                   {Faker::Internet.free_email}
    password                {"1234abcd"}
    password_confirmation   {password}
    familyname              {person.last.kanji}
    firstname               {person.first.kanji}
    familyname_kana         {person.last.katakana}
    firstname_kana          {person.first.katakana}
    birthday                { Faker::Date.birthday}
  end
end