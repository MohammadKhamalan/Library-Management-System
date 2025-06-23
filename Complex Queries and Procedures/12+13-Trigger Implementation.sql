CREATE TABLE AuditLog (
    AuditID INT PRIMARY KEY IDENTITY(1,1),
    BookID INT, 
    StatusChange NVARCHAR(50), 
    ChangeDate DATETIME
);

CREATE TRIGGER trg_StatusChange
ON Books
AFTER UPDATE
AS 
BEGIN
    INSERT INTO AuditLog (BookID, StatusChange, ChangeDate)
    SELECT 
        i.BookID,
        CONCAT(d.CurrentStatus, ' to ', i.CurrentStatus),
        GETDATE()
    FROM inserted i
    JOIN deleted d ON d.BookID = i.BookID
    WHERE d.CurrentStatus <> i.CurrentStatus;
END;

UPDATE Books
SET CurrentStatus = 'Available'
WHERE BookID = 1001;

SELECT * FROM AuditLog;
