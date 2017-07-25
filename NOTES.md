User [name, username, email, password, provider, uid]
- has_many resources
- has_many comments

Resource [title, url, description, user_id, language_id]
- belongs_to user
- belongs_to language
- has_many resource_tags
- has_many tags, through: resource_tags
- has_many comments

ResourceTag [resource_id, tag_id]
- belongs_to resource
- belongs_to tag

Tag [name]
- has_many resource_tags
- has_many resources, through resource_tags

Language [name, description]
- has_many resources

ResourceLanguage [language_id, resource_id]
- belongs_to resource
- belongs_to langauge

Comment [content, user_id, resource_id]
- belongs_to resource
- belongs_to user
