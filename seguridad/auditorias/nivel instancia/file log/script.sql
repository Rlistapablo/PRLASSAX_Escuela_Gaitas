USE master
GO 
CREATE SERVER AUDIT Gaitas_Auditoria_log
    TO FILE
    (
        FILEPATH = '\extras',
        MAXSIZE = 0MB,
        max_rollover_files = 100000,
        reserve_disk_space = off
    )
WITH (QUEUE_DELAY = 5000, ON_FAILURE = CONTINUE)
GO
ALTER SERVER AUDIT Gaitas_Auditoria_log WITH (STATE=ON)
GO