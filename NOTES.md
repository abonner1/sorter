User [name, username, email, password, provider, uid]
- has_many resources
- has_many enrolled_courses
- has_many courses, through: enrolled_courses
- has_many comments

Resource [title, url, description, user_id, language_id]
- belongs_to user
- belongs_to language
- has_many resource_topics
- has_many topics, through: resource_topics
- has_many course_resources
- has_many courses, through: course_resources
- has_many resource_comments
- has_many comments, through resource_comments

ResourceTopics [resource_id, topic_id]
- belongs_to resource
- belongs_to topic

Topic [name]
- has_many resource_topics
- has_many resources, through resource_topics

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

Comment
- has_many resource_comments
- has_many resources, through resource_comments
- belongs_to user

ResourceComments
- belongs_to Comment
- belongs_to resource
