User [name, username, email, password, provider, uid]
- has_many resources
- has_many enrolled_courses
- has_many courses, through: enrolled_courses
- has_many comments

Resource [title, url, description, user_id, language_id]
- belongs_to user
- belongs_to language
- has_many resource_tags
- has_many tags, through: resource_tags
- has_many course_resources
- has_many courses, through: course_resources
- has_many comments

ResourceTags [resource_id, tag_id]
- belongs_to resource
- belongs_to tag

Tag [name]
- has_many resource_tags
- has_many resources, through resource_tags

Language [name]
- has_many resources

EnrolledCourses [user_id, course_id]
- belongs_to user
- belongs_to course

Course [title, description]
- has_many enrolled_courses
- has_many users, through: enrolled_courses

CourseResources [course_id, resource_id]
- has_many course_resources
- has_many resources, through: course_resources

Comment [content, user_id, resource_id]
- belongs_to resource
- belongs_to user
