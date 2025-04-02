-- Delete only the dependencies that are explicitly marked as deleted
{% if 'deleted' in data.jdependencies %}
DELETE FROM pgagent.pga_job_dependency
WHERE jobid = {{ jid|qtLiteral(conn) }} AND dependent_jobid IN (
    {% for dep in data.jdependencies.deleted %}
    {{ dep.dependent_jobid|qtLiteral(conn) }}{% if not loop.last %}, {% endif %}
    {% endfor %}
);
{% endif %}

-- Add new dependencies
{% if 'added' in data.jdependencies %}
INSERT INTO pgagent.pga_job_dependency (jobid, dependent_jobid)
VALUES
{% for dep in data.jdependencies.added %}
({{ jid|qtLiteral(conn) }}, {{ dep.dependent_jobid|qtLiteral(conn) }}){% if not loop.last %}, {% endif %}
{% endfor %};
{% endif %} 