t1 = Topic.create(topic_type: "mental health")
t2 = Topic.create(topic_type: "relocation")
t1 = Topic.create(topic_type: "anxiety")


u1 = User.create(username:"one", password: "123", email:"one@email.com")
Subscription.create(topic: t1, user: u1)
Subscription.create(topic: t2, user: u1)
Subscription.create(topic: t3, user: u1)


u2 = User.create(username:"two", password: "123", email:"two@email.com")
Subscription.create(topic: t1, user: u2)
Subscription.create(topic: t2, user: u2)
Subscription.create(topic: t3, user: u2)

u3 = User.create(username:"three", password: "123", email:"three@email.com")
Subscription.create(topic: t1, user: u3)
Subscription.create(topic: t2, user: u3)
Subscription.create(topic: t3, user: u3)

u4 = User.create(username:"four", password: "123", email:"four@email.com")
Subscription.create(topic: t1, user: u4)
Subscription.create(topic: t2, user: u4)
Subscription.create(topic: t3, user: u4)

p1 = Post.create(user: u1, content: "I am pretty sad because I just moved and I don't know anyone around me")
pt1 = PostTopic.create(post: p1, topic: t1)
pt2 = PostTopic.create(post: p1, topic: t2)

p2 = Post.create(user: u1, content: "I'm pretty anxious that I think people only wanna be my friend because I am there")
pt3= PostTopic.create(post: p2, topic: t1)
pt4= PostTopic.create(post: p2, topic: t3)


p3 = Post.create(user: u3, content: "I am nervous about this new job, I don't think I tricked everyone to hire me and I am not ready")
pt5= PostTopic.create(post: p3, topic: t1)
pt6= PostTopic.create(post: p3, topic: t3)

Note.create(user: u2, post: p1, content: "No, I totally get you, this is hard stuff to deal with but I beleive in you")
Note.create(user: u4, post: p3, content: "Your anxieties are valid but know that they arent you")
Note.create(user: u2, post: p2, content: "I believe you and I trust you can get through this")