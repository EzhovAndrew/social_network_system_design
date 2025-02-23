Table subscriptions {
  id integer [primary key]
  following_user_id integer [not null]
  followed_user_id integer [not null]
  created_at timestamp [not null]
  updated_at timestamp [not null]
}

Table users {
  id integer [primary key]
  username varchar [not null]
  created_at timestamp [not null]
  updated_at timestamp [not null]
}


Ref: users.id < subscriptions.following_user_id

Ref: users.id < subscriptions.followed_user_id
