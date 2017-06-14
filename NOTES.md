User [name, username, email, password, provider, uid]
- has_many resources

Resource [title, url, description, user_id, language_id]
- belongs_to user
- belongs_to language
- has_many resource_topics
- has_many topics, through: resource_topics

ResourceTopics [resource_id, topic_id]
- belongs_to resource
- belongs_to topic

Topic [name]
- has_many resource_topics
- has_many resources, through resource_topics

Language [name]
- has_many resources
