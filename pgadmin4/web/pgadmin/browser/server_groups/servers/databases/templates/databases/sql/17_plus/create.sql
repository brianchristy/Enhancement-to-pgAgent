{% if data %}
CREATE DATABASE {{ conn|qtIdent(data.name) }}
{% if data.datowner %}
    WITH{% endif %}{% if data.datowner %}

    OWNER = {{ conn|qtIdent(data.datowner) }}{% endif %}{% if data.template %}

    TEMPLATE = {{ conn|qtIdent(data.template) }}{% endif %}{% if data.encoding %}

    ENCODING = {{ data.encoding|qtLiteral(conn) }}{% endif %}{% if data.datstrategy %}

    STRATEGY = {{ data.datstrategy|qtLiteral(conn) }}{% endif %}{% if data.datcollate %}

    LC_COLLATE = {{ data.datcollate|qtLiteral(conn) }}{% endif %}{% if data.datctype %}

    LC_CTYPE = {{ data.datctype|qtLiteral(conn) }}{% endif %}{% if data.daticulocale and data.datlocaleprovider == 'icu' %}

    ICU_LOCALE = {{ data.daticulocale|qtLiteral(conn) }}{% elif data.datbuiltinlocale and data.datlocaleprovider == 'builtin' %}

    BUILTIN_LOCALE = {{ data.datbuiltinlocale|qtLiteral(conn) }}{% endif %}{% if data.daticurules %}

    ICU_RULES = {{ data.daticurules|qtLiteral(conn) }}{% endif %}{% if data.datlocaleprovider %}

    LOCALE_PROVIDER = {{ data.datlocaleprovider|qtLiteral(conn) }}{% endif %}{% if data.spcname %}

    TABLESPACE = {{ conn|qtIdent(data.spcname) }}{% endif %}{% if data.datconnlimit %}

    CONNECTION LIMIT = {{ data.datconnlimit }}{% endif %}{% if data.datoid %}

    OID = {{ data.datoid }}{% endif %}

    IS_TEMPLATE = {{ data.is_template }};
{% endif %}
