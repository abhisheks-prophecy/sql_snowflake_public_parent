from staging_abhisheks_e2etests_sql_parentsnowflake_sanity_sql_snow_parent_airflowcomposerjob.utils import *

def Model_0():
    from airflow.operators.python import PythonOperator
    from datetime import timedelta
    import os
    import zipfile
    import tempfile

    return PythonOperator(
        task_id = "Model_0",
        python_callable = invoke_dbt_runner,
        op_kwargs = {
          "is_adhoc_run_from_same_project": False,
          "is_prophecy_managed": False,
          "run_deps": True,
          "run_seeds": True,
          "run_parents": False,
          "run_children": False,
          "run_tests": True,
          "run_mode": "project",
          "entity_kind": "model",
          "entity_name": None,
          "project_id": "67",
          "git_entity": "branch",
          "git_entity_value": "dev_staging",
          "git_ssh_url": "https://github.com/abhisheks-prophecy/sql_snowflake_public_parent",
          "git_sub_path": "",
          "select": "",
          "threads": "",
          "exclude": "",
          "run_props": " --profile run_profile_snowflake",
          "envs": {"DBT_DATABRICKS_INVOCATION_ENV" : "prophecy", "DBT_PROFILES_DIR" : "/home/airflow/gcs/data"},
          "project_config": None
        },
        retries = 0
    )
