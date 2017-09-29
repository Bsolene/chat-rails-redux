
Message.destroy_all
User.destroy_all
Channel.destroy_all

Channel.create(name: "general")
Channel.create(name: "react")
Channel.create(name: "paris")

User.create(email: "a@a.fr", password: "123123", nickname: "Jack")
User.create(email: "b@b.fr", password: "123123", nickname: "Bob")
User.create(email: "c@c.fr", password: "123123", nickname: "Fanny")


Message.create(content: "hello react", user_id: 1, channel_id: 2)
Message.create(content: "hello paris", user_id: 2, channel_id: 3)
Message.create(content: "hello word", user_id: 3, channel_id: 1)
Message.create(content: "welcome to react", user_id: 2, channel_id: 2)

