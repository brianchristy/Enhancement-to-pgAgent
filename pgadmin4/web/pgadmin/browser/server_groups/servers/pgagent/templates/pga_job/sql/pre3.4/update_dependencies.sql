-- Delete existing dependencies
DELETE FROM pgagent.pga_job_dependency
WHERE jobid = {{ jid|qtLiteral(conn) }}::integer;

{% if 'jdependencies' in data and data.jdependencies|length > 0 %}
-- Insert new dependencies
{% for dep in data.jdependencies %}
INSERT INTO pgagent.pga_job_dependency (
    jobid,
    dependent_jobid
) VALUES (
    {{ jid|qtLiteral(conn) }}::integer,
    {{ dep.dependent_jobid|qtLiteral(conn) }}::integer
);
{% endfor %}
{% endif %} 