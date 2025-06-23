CREATE FUNCTION fn_BookBorrowingFrequency(@BookID INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @BorrowingCount DECIMAL(10,2);

    SELECT @BorrowingCount = COUNT(*)
    FROM Loans 
    WHERE BookID = @BookID;

    RETURN @BorrowingCount;
END;

SELECT dbo.fn_BookBorrowingFrequency(1002) AS BorrowCount;
