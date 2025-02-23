Table posts {
  id integer [primary key]
  user_id integer [not null]
  location_id integer [not null]
  description text
  created_at timestamp [not null]
  updated_at timestamp [not null]
}

Table comments {
  id integer [primary key]
  text varchar(200) [not null]
  post_id integer [not null]
  reply_to_id integer
  created_at timestamp [not null]
  updated_at timestamp [not null]
}

Table reactions {
  post_id integer
  user_id integer

  indexes {
    (post_id, user_id) [pk]
  }
}

// Store photos itself in ceph and access them using s3-api
Table photos {
  id integer [primary key]
  post_id integer
  s3_key varchar(200) [not null]
}

// Special table to return users's feed posts
Table feed {
  user_id integer [primary key]
  post_id integer
  appended_at timestamp
}

// Special table to return locations's feed posts
// For popular locations that have high metrics(something that analysts will consider important)
Table popular_locations_feed {
  location_id integer [primary key]
  post_id integer
  appended_at timestamp
}

Ref: comments.post_id > posts.id

Ref: comments.reply_to_id - comments.id

Ref: reactions.post_id > posts.id

Ref: photos.post_id > posts.id

Ref: feed.post_id > posts.id