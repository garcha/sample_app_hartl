namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		admin = User.create!(name: "Jaspreet Garcha",
							email: "jaspreet@garcha.com",
							password: "-singh16",
							password_confirmation: "-singh16",
							admin: true)

		User.create!(name: "Example User",
								 email: "example@gmail.com",
								 password: "foobar",
								 password_confirmation: "foobar")
		99.times do |n|
			name = Faker::Name.name
			email = "example+#{n+1}@gmail.com"
			password = "password"
			User.create!(name: name,
									 email: email,
									 password: password,
									 password_confirmation: password)
		end

		users = User.all(limit: 6)
	    50.times do
	      content = Faker::Lorem.sentence(5)
	      users.each { |user| user.microposts.create!(content: content) }
	    end
	end
end

