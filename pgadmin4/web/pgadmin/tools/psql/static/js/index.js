/////////////////////////////////////////////////////////////
//
// pgAdmin 4 - PostgreSQL Tools
//
// Copyright (C) 2013 - 2025, The pgAdmin Development Team
// This software is released under the PostgreSQL Licence
//
//////////////////////////////////////////////////////////////


import pgAdmin from 'sources/pgadmin';
import pgBrowser from 'top/browser/static/js/browser';
import Psql from './PsqlModule';


if(!pgAdmin.Tools) {
  pgAdmin.Tools = {};
}
pgAdmin.Tools.Psql = Psql.getInstance(pgAdmin, pgBrowser);

module.exports = {
  Psql: Psql
};
