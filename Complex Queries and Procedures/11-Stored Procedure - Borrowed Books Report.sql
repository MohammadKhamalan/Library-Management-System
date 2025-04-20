CREATE PROCEDURE sp_BorrowedBooksReport 
   @StartDate DATE,
   @EndDate DATE
    
AS
BEGIN
    SELECT B.Title,Br.FirstName, Br.LastName, L.DateBorrowed
	FROM Loans L
	JOIN Books B ON B.BookID=B.BookID
	JOIN Borrowers Br ON Br.BorrowerID=L.BorrowerID
	WHERE L.DateBorrowed BETWEEN @StartDate AND @EndDate
END;
EXEC sp_BorrowedBooksReport 
    @StartDate = '2020-01-01',
    @EndDate = '2020-12-31';
