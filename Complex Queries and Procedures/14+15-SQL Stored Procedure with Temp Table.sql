CREATE PROCEDURE sp_OverdueBooks
AS
BEGIN
    CREATE TABLE #OverdueBorrowers (
        BorrowerID INT,
        FirstName VARCHAR(100),
        LastName VARCHAR(100)
    );

    INSERT INTO #OverdueBorrowers 
    SELECT Br.BorrowerID, Br.FirstName, Br.LastName  
    FROM Borrowers Br 
    JOIN Loans L ON L.BorrowerID = Br.BorrowerID
    WHERE L.DateReturned IS NULL AND DATEDIFF(DAY, L.DueDate, GETDATE()) > 0;

    SELECT 
        O.*, 
        B.Title, 
        L.DueDate
    FROM #OverdueBorrowers O
    JOIN Loans L ON O.BorrowerID = L.BorrowerID
    JOIN Books B ON B.BookID = L.BookID
    WHERE L.DateReturned IS NULL 
      AND DATEDIFF(DAY, L.DueDate, GETDATE()) > 0;

    DROP TABLE #OverdueBorrowers;
END;


EXEC sp_OverdueBooks