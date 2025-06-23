DECLARE @BorrowerID INT= 1;
SELECT B.*, Br.FirstName AS [Borrower First Name], Br.LastName AS [Borrower Last Name]
FROM Books B
INNER JOIN Loans L ON B.BookID =L.BookID 
INNER JOIN Borrowers Br ON Br.BorrowerID=L.BorrowerID
WHERE L.BorrowerID=@BorrowerID;