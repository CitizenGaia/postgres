#!/bin/bash
psql=( psql -v ON_ERROR_STOP=1 --username postgres)

"${psql[@]}" <<-ENDOFSQL
	CREATE ROLE test
	  PASSWORD 'test'
	  NOCREATEDB
	  NOCREATEROLE
	  NOCREATEUSER
	  LOGIN
	;

	CREATE DATABASE test
	  OWNER test
	  ENCODING 'UTF8'
	;

	REVOKE ALL PRIVILEGES ON DATABASE test
    FROM public;
ENDOFSQL
