User.destroy_all
WishList.destroy_all
Wish.destroy_all
Share.destroy_all

# USERS USERS USERS USERS USERS USERS USERS USERS USERS USERS USERS USERS USERS USERS USERS USERS USERS USERS USERS USERS
pw = SecureRandom.urlsafe_base64
names = ['fenchurch', 'bourgeois', 'sissa', 'hillyer', 'hammond']
users = User.create(
	names.map { |name| {password: pw, username: name} }
)

# LISTS LISTS LISTS LISTS LISTS LISTS LISTS LISTS LISTS LISTS LISTS LISTS LISTS LISTS LISTS LISTS LISTS LISTS LISTS LISTS
wish_lists = WishList.create(
	users.map do |user|
		{name: "#{user.username} turning #{user.id + 1} yo", user_id: user.id, is_public: [true, false].sample}
	end
)
wish_lists += WishList.create(
	users.map do |user|
		{name: "#{user.username} christmas list", user_id: user.id, is_public: [true, false].sample}
	end
)

# WISHES WISHES WISHES WISHES WISHES WISHES WISHES WISHES WISHES WISHES WISHES WISHES WISHES WISHES WISHES WISHES WISHES
def granter_id(id, users)
	users.reject { | user| user.id == id }.sample
end

items = ['pony', 'chainsaw', 'halo', 'ps4', 'transformer', 'pokemon cards']
wishes = []
wish_lists.each do |wish_list|
	my_wishes = []
	until my_wishes.size == 4
		item = items.sample
		my_wishes << item unless my_wishes.include? item
	end
	wishes << Wish.create(
		my_wishes.map do |wish|
			{name: wish, wish_list_id: wish_list.id, granter_id: ([true, false].sample ? granter_id(wish_list.user_id, users) : nil)}
		end
	)
end

# SHARES SHARES SHARES SHARES SHARES SHARES SHARES SHARES SHARES SHARES SHARES SHARES SHARES SHARES SHARES SHARES SHARES
shares =[]
wish_lists.each do |wish_list|
	next if wish_list.is_public
	shareables = users.reject { | user| user.id == wish_list.user_id }.shuffle
	shared_with = [granter_id(wish_list.user_id, users)]
	until [true, false].sample || shareables.empty?
		shared_with << shareables.pop
	end
	shares += Share.create(
		shared_with.map do |recipient|
			{wish_list_id: wish_list.id, user_id: recipient.id}
		end
	)
end
