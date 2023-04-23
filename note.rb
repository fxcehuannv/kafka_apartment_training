lenses: https://help.lenses.io/quickstart/
start lenses: docker run -e LENSES_PORT=8080 -p 8080:8080 lensesio/lenses
start kafka: brew services stop kafka
https://help.lenses.io/knowledge-base/setup/setup-wizard/

kafka = Kafka.new(["localhost:9092"], client_id: "my-application")
kafka = Kafka.new("localhost:9092", client_id: "my-application")
kafka = Kafka.new("localhost:9092", client_id: "my-application", resolve_seed_brokers: true)
kafka.deliver_message("Hello, World!", topic: "greetings")
kafka.deliver_message("Hello, World!", topic: "greetings", partition: 42)
