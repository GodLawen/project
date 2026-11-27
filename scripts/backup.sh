#!/usr/bin/env bash
set -euo pipefail
umask 077
: "${PGDATABASE:?Set PGDATABASE to the source database name}"
dir=${BACKUP_DIR:-/var/backups/habittrack}
mkdir -p -- "$dir"
cd -- "$dir"
exec 9>.habittrack.lock
flock -n 9 || { echo 'Backup already running' >&2; exit 1; }
tmp=$(mktemp .habittrack.XXXXXXXX)
trap 'rm -f -- "$tmp"' EXIT
pg_dump --format=custom --no-password --file="$tmp" --dbname="$PGDATABASE"
pg_restore --list "$tmp" >/dev/null
name="habittrack-$(date -u +%Y%m%dT%H%M%S%NZ).dump"
mv -- "$tmp" "$name"
export LC_ALL=C
shopt -s nullglob
copies=(habittrack-[0-9]*.dump)
excess=$(( ${#copies[@]} - 7 ))
if (( excess > 0 )); then
  rm -- "${copies[@]:0:excess}"
fi
