{% if salt['pillar.get']('icinga2:postgres:use_formula', False) %}
include:
  - postgres.client
  - postgres.server

extend:
  postgres-server:
    pkg:
    - require_in:
      - pkg: icinga2-ido-pgsql
  postgres-client-libs:
    pkg:
    - require_in:
      - pkg: icinga2-ido-pgsql
{% else %}
postgresql_packages_for_icinga_ido:
  pkg.installed:
    - pkgs:
      - postgresql
      - postgresql-client
    - require_in:
      - pkg: icinga2-ido-pgsql
{% endif %}
