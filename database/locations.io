Table locations {
  id integer [primary key]
  longitude double [not null]
  latitude  double [not null]
  description text [not null]
  name varchar(50) [not null]
}

Table ratings {
  user_id integer
  location_id integer

  indexes {
    (user_id, location_id) [pk]
  }
}

Ref: ratings.location_id > locations.id

// For fast locations search and full text search duplicate
// them into elasticsearch/opensearch