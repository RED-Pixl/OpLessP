import redis

cache = redis.Redis(host="localhost", port=6379)

cache.set("France", "Paris")
cache.set("Germany", "Berlin")

print(cache.get("Germany"))
print(cache.get("France"))