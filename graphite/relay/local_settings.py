import uuid

TIME_ZONE = 'Europe/London'
MEMCACHE_HOSTS = []
LOG_RENDERING_PERFORMANCE = False
LOG_CACHE_PERFORMANCE = False
DEBUG = False
SECRET_KEY = str(uuid.uuid4())
CLUSTER_SERVERS=["cache_1:8080", "cache_2:8080"]
