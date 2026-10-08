## ⚠️ This repository has moved

The official image is now **[`candour/candour-hr`](https://hub.docker.com/r/candour/candour-hr)**.

This mirror still receives every stable release, so existing `docker pull candour/candour` deployments keep working — nothing breaks today. But new tags, documentation and support all target `candour/candour-hr` first.

**To switch,** change the image name in your compose file or deployment:

```diff
- image: candour/candour:latest
+ image: candour/candour-hr:latest
```

Both names are built from the same commit and are byte-identical. The examples below use the new name.

> **Following an older guide?** The instruction to run `candour/candour:1.4` with `manage.py runserver` is obsolete — it pins a January 2026 image and uses Django's development server, which is not suitable for production. Use the Docker Compose setup below.
