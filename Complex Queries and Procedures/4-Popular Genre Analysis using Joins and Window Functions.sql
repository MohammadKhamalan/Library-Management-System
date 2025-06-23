DECLARE @Month INT = 11;
SELECT TOP 1 Genre, COUNT(*) AS BorrowCount
FROM Books B
JOIN Loans L ON L.BookID=B.BookID
WHERE MONTH(L.DateBorrowed)=@Month
GROUP BY Genre
ORDER BY BorrowCount DESC
