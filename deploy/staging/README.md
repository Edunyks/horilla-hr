# Staging Deployment

The staging deployment is a Coolify Docker Compose application:

- `docker-compose.yml` starts `web` (gunicorn), `scheduler` and `redis`, with
  optional bundled PostgreSQL via the `embedded-db` Compose profile.
- All app services build the repository's root `Dockerfile`. Unlike canteen,
  no separate `Dockerfile.staging`, nginx or supervisord is needed: gunicorn
  serves the app and WhiteNoise serves static files from the same process.
- `migrate` is a one-shot service that runs `migrate` and
  `collectstatic --clear` (via `docker/entrypoint.sh`) before `web` and
  `scheduler` start.
- Coolify's proxy terminates TLS and forwards to gunicorn on port `8000`.

Set the Coolify public service to `web` and application port `8000`. Use
`deploy/staging/docker-compose.yml` as the Compose file location.

Required Coolify variables are listed in `.env.example`. Keep real secret values
in Coolify or the deployment secret store only.

## Database

The app reads its database connection from `DATABASE_URL`. The entrypoint also
waits on `DB_HOST:DB_PORT` before migrating, so keep those in step with the URL.
The `.env.example` defaults use the bundled disposable Postgres service by
enabling `COMPOSE_PROFILES=embedded-db` and pointing `DATABASE_URL` at
`postgres:5432/horilla_staging`.

To use a dedicated or managed Postgres instance, remove `embedded-db` from
`COMPOSE_PROFILES`, then set:

```env
DATABASE_URL=postgres://user:password@your-db-host:5432/horilla_staging?sslmode=require
DB_HOST=your-db-host
DB_PORT=5432
```

The `POSTGRES_*` variables are only for the bundled Postgres container.

## Migrations

Schema migrations are applied by the `migrate` Compose service, not by the
`web` container. `web` and `scheduler` set `HORILLA_SKIP_RELEASE_TASKS=1` and
depend on `migrate` completing successfully. If a migration fails, Compose
leaves the app stopped instead of starting it against an incompatible schema,
and the two long-running containers never race each other on DDL.

To rerun migrations manually from the staging Compose project:

```sh
docker compose -f deploy/staging/docker-compose.yml run --rm migrate
```

Django migrations should be treated as forward-only on staging. If a migration
fails after partially changing the database, recover with a restore or a
forward-fix migration.

## First run

With `DEBUG=0` the app refuses to start on placeholder secrets: `SECRET_KEY`,
`DB_INIT_PASSWORD` and `ALLOWED_HOSTS` must be real values. After the first
deploy, open `https://<your-host>/` and complete the database initialization
flow using `DB_INIT_PASSWORD`.

Keep `localhost` in `ALLOWED_HOSTS`: the container healthcheck calls
`http://localhost:8000/health/`, and Django answers any unlisted host with 400.

## Scheduler

`scheduler` runs `python manage.py run_scheduler` for background jobs. Keep it
at exactly one replica; the jobs are not idempotent. `web` can be scaled.

## Volumes

- `horilla-staging-media` — uploaded files, shared by `web`, `scheduler` and
  `migrate`. Back this up alongside the database.
- `horilla-staging-staticfiles` — collected static files, rebuilt on every
  deploy by `migrate`.
- `horilla-staging-postgres`, `horilla-staging-redis` — bundled services' data.
