# Scripts BD Green Aviation

Ejecutar en orden numérico sobre PostgreSQL (pgAdmin Query Tool o psql).

| Orden | Archivo |
|-------|---------|
| 1 | `01_schema_base.sql` |
| 2 | `02_migration_001.sql` … hasta `06_migration_005.sql` |
| 3 | `07_schema_examenes.sql` |
| 4 | `08_inserts_capitulo_1.sql` … `19_inserts_capitulo_13.sql` |

Alternativa: si ya tenés la BD creada, podés usar el dump `migracionGreenAviation` (ejecutar en Supabase Query Editor o psql).
