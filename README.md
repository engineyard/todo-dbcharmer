# Development Setup

`rake db:create` does not work properly with dbcharmer so we need to manually create the databases.
in mysql console:

```mysql
create database todo_dbcharmer_development_a;
create database todo_dbcharmer_development_b;
create database todo_dbcharmer_test_a;
create database todo_dbcharmer_test_b;
```

